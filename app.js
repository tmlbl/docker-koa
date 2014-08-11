var koa = require('koa');
var app = koa();

// logger

app.use(function *(next) {
  var start = new Date;
  yield next;
  var ms = new Date - start;
  console.log('%s %s - Response: %sms', this.method, this.url, ms);
});

// response

app.use(function *() {
  this.body = 'Thanks for your ' + this.method + '\n';
});

app.listen(3000);
