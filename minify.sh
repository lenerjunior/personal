#!/bin/bash
pwd;
if [[ ! $# -eq 1 ]]; then
  echo "must inform file to minify";
  exit 1;
fi

if [[ ! -e "$1" ]]; then
  echo "must inform valid file to minify";
  exit 1;
fi

function mini() {
  sed -E 's:^( |\t)+::' $1 | tr -d '\n' > ${1}.tmp;
  mv ${1}.tmp ${1};
}

if [[ -d "$1" ]]; then
  for file in "$(find $1 -name "*.html")"; do
    mini $file;
  done;
else
  mini $1;
fi
