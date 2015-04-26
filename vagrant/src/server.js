/* NOTE for nodejs to be seen outside of the VM:
 *  https://stackoverflow.com/questions/27638889/unable-to-connect-to-node-js-in-vagrant/27642231#27642231
 * Also of import:
 *  sudo netstat -ltpn
 *  ifconfig
 */

//
// POC that just serves up the static files
//
var static = require('node-static');
var http = require('http');

var file = new(static.Server)();

http.createServer(function (req, res) {
  console.log('a file connection!');
  file.serve(req, res);
}).listen(3000);
console.log('Server running at http://127.0.0.1:3000/');

