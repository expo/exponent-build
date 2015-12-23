#!/bin/bash

# clean old
rm -rf clone build

# clone from git
git clone git@github.com:exponentjs/exponent-host-internal.git clone

# extract bare tree
cd clone
mkdir ../build
git archive master | tar -x -C ../build
cd ../build

# build
npm install
npm run gulp -- clean
npm run gulp -- build
