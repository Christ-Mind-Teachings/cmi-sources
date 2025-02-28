# cmi-sources

This forms the root directory of the Christ Mind Teachings (CMI) website
development environment. It contains scripts to build development and
production versions of the site and common NPM modules used by all CMI
sources.

When setting up a development environment clone this repository first
and then clone other CMI respositories into this directory.

The directory structure should look like this:

cmi-source
→ cmi-acim: ACIM Sparkly Edition
→ cmi-acol: A Course of Love
→ cmi-audio-plugins: Audio player plugins
→ cmi-col: Choose Only Love
→ cmi-common: Code used by all sources
→ cmi-ftcm: From the Christ Mind
→ cmi-jsb: The Impersonal Life
→ cmi-oe: ACIM Original Edition
→ cmi-pwom: Polish language version of The Way of Mastery
→ cmi-raj: The Raj Material
→ cmi-wom: Way of Mastery
→ cmi-www: CMI Homepage and documentation

## Build

There are two steps for the build. First is webpack that runs for each
source followed by jekyll.

There is a separate jekyll project for each source and cmi-www.
Development builds a jekyll site to cmi-www/\_site/t/<sid> and
production builds a jekyll site to cmi-www/t/<sid>. <sid> is the source
identifier.

This makes cmi-www the root of the resulting website. Files common to
all sources are found in cmi-www/public.

During development we typically run the development environment for
cmi-www and the source undergoing change. Just run

```
$ npm start
```

from the the root directory of cmi-www and the source being changed.
This will run both jekyll and webpack in server mode that watches for
file changes.

You can also build all sources for development or production at once. Use

```
$ ./_buildCMI <dev | prod>
```

After the build complete the log is displayed so you can look for
errors. The last line of the log file tells you what to do next. For a
**dev** build run:

```
$ cd cmi-www
$ npm run dev
```

This will run the jekyll build for cmi-www and start the server. Go to
localhost:9999 to test the build.

For a **prod** build run:

```
$ cd cmi-www
$ npm run preview
```

This will run the jekyll production build for cmi-www and start the
server. Go to localhost:9999 to test the build.

## Deploy to Netlify

We deploy to Netlify using the npm installed netlify-cli. Install that
globally with

```
$ npm i -g netlify-cli
```

Before you deploy do a production build and test using with your browser
as described above. If all looks good

```
$ cd cmi-www
$ netlify deploy -m "deploy message"
```

This will upload the files to netlify and create a test site. The test
URL will be displayed when the deploy is finished. Go there and make
sure all is working well. If it's good then deploy to production with:

```
$ cd cmi-www
$ netlify deploy --prod -m "deploy message"
```

Note: Netlify will attempt to deploy cmi-www to production whenever
changes are pushed to github. We always lock the Netlify auto publishing
feature since cmi-www does not track changes by the other sources. You
can only publish successfully using the command line utility as
described here.






