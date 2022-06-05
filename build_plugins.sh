
#!/bin/bash


mkdir -p plugins
pushd plugins 2>&1 >/dev/null

# find all the build.sh scripts and run them
for f in $(find . -name 'build.sh') ; do
  base=$(dirname "$f")
  pushd "$base" 2>&1 >/dev/null
  $(./build.sh)
  popd 2>&1 >/dev/null
done;


# copy the plugins to a dist directory
rm -rf dist
mkdir -p dist

for f in $(find . -name '*_plugin') ; do
  mv "$f" dist  
done;

popd 2>&1 >/dev/null
