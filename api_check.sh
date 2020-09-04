if [[ $# -eq 0 ]]
then
    echo "No arguments supplied, reading from file"
    while IFS= read -r line; do find . -type f -name "*.yaml" -exec echo {} \; -exec kubectl deprecations --error-on-deleted --error-on-deprecated --k8s-version=$line --input-file {} \;; done < .suported-k8s-versions
else
    find . -type f -name "*.yaml" -exec echo {} \; -exec kubectl deprecations --error-on-deleted --error-on-deprecated --k8s-version=v$1 --input-file {} \;
fi
