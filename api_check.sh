#!/usr/bin/env bash

if ! RES=$(kubectl deprecations 2>&1)
then
  echo '`kubectl deprecations` did not run ok. You may need to install the krew 'deprecations' package. See https://krew.sigs.k8s.io/'
  echo 'OUTPUT:'
  echo "${RES}"
  exit 1
fi

if [[ $# -eq 0 ]]
then
  while IFS= read -r line
  do
    echo "================================================================================"
    echo "Looking at k8s version: ${line}"
    echo "================================================================================"
    echo
    for f in $(find . -type f -name "*.yaml")
    do
      echo -n "${f} "
      if RES=$(kubectl deprecations --error-on-deleted --error-on-deprecated --k8s-version="$line" --input-file "${f}" 2>&1)
      then
        echo '....OK'
      else
        echo
        echo "================================================================================"
        echo "Problem with file: ${f} on k8s version ${line}"
        echo "================================================================================"
        echo "Output was: ${RES}"
        echo "================================================================================"
        echo
        echo "Checking files... "
      fi
    done
  done < .supported-k8s-versions
else
  find . -type f -name "*.yaml" -exec echo {} \; -exec kubectl deprecations --error-on-deleted --error-on-deprecated --k8s-version="v$1" --input-file {} \;
fi
