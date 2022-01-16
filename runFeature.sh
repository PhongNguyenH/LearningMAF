mkdir -p ./test/report
node ./node_modules/@cucumber/cucumber/bin/cucumber-js -f json:test/report/report.json ./features/MyLearning.feature
#start chrome.exe %cd%/test/report/index.html
result=$?
echo "result = $result"
node ./node_modules/@ln-maf/core/multiReport.js
#exit $result
