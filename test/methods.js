var expect = require('chai').expect,
    superagent = require('superagent');

describe('Koa application', function () {

  it('should respond to a GET request', function (done) {
    superagent.get('http://localhost:3000/', function (err, res) {
      expect(err).to.equal(null);
      expect(res.text.indexOf('GET')).to.not.equal(-1);
      done();
    });
  });

  it('should respond to a PUT request', function (done) {
    superagent.put('http://localhost:3000/', function (err, res) {
      expect(err).to.equal(null);
      expect(res.text.indexOf('PUT')).to.not.equal(-1);
      done();
    })
  });

  it('should respond to a PATCH request', function (done) {
    superagent.patch('http://localhost:3000/', function (err, res) {
      expect(err).to.equal(null);
      expect(res.text.indexOf('PATCH')).to.not.equal(-1);
      done();
    })
  });

  it('should respond to a POST request', function (done) {
    superagent.post('http://localhost:3000/', function (err, res) {
      expect(err).to.equal(null);
      expect(res.text.indexOf('POST')).to.not.equal(-1);
      done();
    })
  });

});
