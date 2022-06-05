#!/bin/bash


# pull git repos with an API key


key=$(<.api_key)
path=$1
pushd $path


for dir in */; do
 pushd $dir
 repo=$(git remote -v | grep fetch | cut -f2 | cut -d' ' -f1)
 repo=$(echo ${repo//https:\/\//https://checkmate:$key@})
 echo $repo
 git pull $repo
 popd
done

popd