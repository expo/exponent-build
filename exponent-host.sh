#!/bin/bash

GIT_URL=git@github.com:exponentjs/exponent-host-internal.git
BUILD_DIR=~/build/exponent-host

# clean old
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR
cd $BUILD_DIR

# clone from git
git clone $GIT_URL clone

# extract bare tree
cd clone
mkdir ../bare
git archive master | tar -x -C ../bare
cd ../bare

# build
npm install
npm run gulp -- clean
npm run gulp -- build
