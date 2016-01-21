#!/bin/bash
set -e

GIT_URL=git@github.com:exponentjs/exponent-host-internal.git
BUILD_DIR=~/build/exponent-host
DEPLOY_DIR=~/exponent-build/exponent-host
NODE_VERSION=4.2.3

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

# select node version
. ~/.nvm/nvm.sh
nvm install $NODE_VERSION
npm update -g npm

# build
npm install
npm run gulp -- clean
npm run gulp -- build
#npm prune --production

# deploy
zip -rqy $BUILD_DIR/archive.zip .
cd $DEPLOY_DIR
eb deploy
