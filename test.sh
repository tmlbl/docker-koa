node --harmony app.js &
node_modules/.bin/_mocha
kill $(pgrep node)

