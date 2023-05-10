#!/bin/bash

cd examples

if ! find . -maxdepth 1 -type d  | grep -v '^\.$' | egrep -vw '(_posts|_includes|\.gif|_sass|_layouts|_site|_sass|assets|\.github|\.git|bin)' | xargs -IXXX ls XXX/XXX.md >/dev/null
then
  echo "Add examples/FOLDER/FOLDER.md to the folder that's mentioned above"
  exit 1
fi

