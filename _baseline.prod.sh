#!/bin/zsh

#   /bin/bash
#
# _baseline.prod.sh
#
# Run webpack for each source and then generate
# the site and put output in cmi-www/t/<source>
#
# run webpack for all sources, including www
for i in acim oe ftcm col acol jsb raj wom pwom www; do
  dir="cmi-${i}"
  cd $dir
  echo "building webpack for $dir"
  npm run base:prod:webpack
  cd ..
done

echo "-------- webpack complete -----------"

# run jekyll for all sources, omit www
for i in acim oe col ftcm acol jsb raj wom pwom; do
  dir="cmi-${i}"
  cd $dir
  echo "building jekyll for $dir"
  npm run base:prod:jekyll
  cd ..
done

echo "-------- jekyll complete -----------"
echo ""
echo "Now, cd to cmi-www and run 'preview'"
echo "$ npm run preview"

# Next go to cmi-www and run
# $ npm run preview
# Check out the result in your browser at localhost:9999
# If okay publish checkout site to Netlify using command line from cmi-www/
# $ netlify deploy
# Visit URL resulting from deploy
# If okay publish production site from cmi-www/
# $ netlify deploy --prod -m "deployment message"
#

