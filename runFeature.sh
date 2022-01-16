#!/bin/sh
mkdir -p test/report
npx preprocessor

npx cucumber-js -f json:test/report/cucumber_report.json --require "features/**/*.js" tmp/features/$*; 
val=$?
npx multiReport
openPy $PWD/test/report/undefined/index.html
exit $val
