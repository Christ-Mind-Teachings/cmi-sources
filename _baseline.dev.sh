#!/bin/bash

#
# _baseline.dev.sh
#
# Run webpack for each source and then generate
# the site and put output in cmi-www/t/<source>
#
# run webpack for all sources, including www
for i in acim oe col ftcm acol jsb raj wom pwom www; do
  dir="cmi-${i}"
  cd $dir
  echo "building webpack for $dir"
  npm run base:dev:webpack
  cd ..
done

echo "-------- webpack complete -----------"

# run jekyll for all sources, omit www
for i in acim oe ftcm col acol jsb raj wom pwom; do
  dir="cmi-${i}"
  cd $dir
  echo "building jekyll for $dir"
  npm run base:dev:jekyll
  cd ..
done

echo "-------- jekyll complete -----------"

echo "Now, cd to cmi-www and run 'dev'"
echo "$ npm run dev"

