#!/usr/bin/env bash

# From: https://betterdev.blog/minimal-safe-bash-script-template/

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  abs_script_dir=$(readlink -f ${script_dir})
elif [[ "$OSTYPE" == "darwin"* ]]; then
  abs_script_dir=$(greadlink -f ${script_dir})
elif [[ "$OSTYPE" == "cygwin" ]]; then
  abs_script_dir=$(readlink -f ${script_dir})
elif [[ "$OSTYPE" == "msys" ]]; then
  abs_script_dir=$(readlink -f ${script_dir})
elif [[ "$OSTYPE" == "win32" ]]; then
  abs_script_dir=$(readlink -f ${script_dir})
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  abs_script_dir=$(readlink -f ${script_dir})
else
  abs_script_dir=$(readlink -f ${script_dir})
fi

usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [ --version <k8s_version>] arg1 [arg2...]

Script description here.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
--version       Kubernetes version, default 'master'
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  flag=0
  k8s_version=master

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -f | --flag) flag=1 ;; # example flag
    --version)
      k8s_versionm="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  #args=("$@")

  # check required params and arguments
  [[ -z "${k8s_version-}" ]] && die "Missing required parameter: k8s_version"
  #[[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

parse_params "$@"
setup_colors

# script logic here

(
  cd ${abs_script_dir}/.. || exit 1
  comm -3 <(find . | grep yaml$ | sort) <(cat .kubeconform-ignore | sort) | xargs -n1 kubeconform --strict -kubernetes-version $k8s_version -ignore-filename-pattern 'Istio/*' -schema-location default -schema-location "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/customresourcedefinition.json" -ignore-filename-pattern 'PodSecurityPolicy/*'
)
