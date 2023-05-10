#!/bin/bash

exit_code=0

cd examples

if ! find . -maxdepth 1 -type d  | grep -v '^\.$' | egrep -vw '(_posts|_includes|\.gif|_sass|_layouts|_site|_sass|assets|\.github|\.git|bin)' | xargs -IXXX ls XXX/XXX.md >/dev/null
then
  echo "Add examples/FOLDER/FOLDER.md to the folder that's mentioned above"
  exit_code=1
fi

for DIR in $(find . -maxdepth 1 -type d  | grep -v '^\.$' | \
    egrep -vw '(_posts|_includes|\.gif|_sass|_layouts|_site|_sass|assets|\.github|\.git|bin)' | sort); do
    YML_COUNT=$(find $DIR -name '*.yaml' | wc -l)
    if [ $YML_COUNT -eq 0 ]; then
      echo "$DIR - No yaml files in this directory!"
      exit_code=1
    fi
done

exit $exit_code
