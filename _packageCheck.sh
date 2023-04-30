#!/bin/zsh

if [[ -z $1 ]]; then
  echo "Your forgot to enter the package name"
  exit
fi

for i in acim oe ftcm col acol jsb raj wom pwom www; do
  dir="cmi-${i}"
  cd $dir
  echo "Looking for package: $1 in project: $dir"
  grep -R "$1" src/js/
  cd ..
done

