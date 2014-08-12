#!/bin/sh

node --harmony app.js &
$(pwd)/node_modules/.bin/_mocha

