#!/bin/bash

if [[ -z "$1" ]]; then
  echo "cannot install: path not provided"
  exit 1
fi
echo "Installing extensions in $1"

cd "$(dirname "$0")"

if [ ! -d "$1/plugins" ]; then
  mkdir "$1/plugins"
fi
if [ ! -d "$1/plugins/@houdoku" ]; then
  mkdir "$1/plugins/@houdoku"
fi

cp -r ../../dist/libs/core $1/plugins/@houdoku/downloader-core
rsync -r ../../node_modules $1/plugins/@houdoku/downloader-core --exclude 'typescript' --exclude 'electron' --exclude '.bin'