/* NOTE for nodejs to be seen outside of the VM:
 *  https://stackoverflow.com/questions/27638889/unable-to-connect-to-node-js-in-vagrant/27642231#27642231
 * Also of import:
 *  sudo netstat -ltpn
 *  ifconfig
 */
/*
var http = require('http');
http.createServer(function (req, res) {
  console.log('a single connection!');
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello Outside World\n');
}).listen(3000, '0.0.0.0');
console.log('Server running at http://127.0.0.1:3000/');
*/
var static = require('node-static');
var http = require('http');

var file = new(static.Server)();

http.createServer(function (req, res) {
  console.log('a file connection!');
  file.serve(req, res);
}).listen(3000);
console.log('Server running at http://127.0.0.1:3000/');