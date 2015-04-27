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
var fs = require('fs');

var file = new(static.Server)();

http.createServer(function (req, res)
{
    console.log('request received');

    if (req.method === "GET")
    {
        if (req.url === "/favicon.ico")
        {
            console.log("GET: /favicon");
            res.writeHead(404, {'Content-Type': 'text/html'});
            res.write('<!doctype html><html><head><title>404</title></head><body>404: Resource Not Found</body></html>');
            res.end();
        }
        else if (req.url === "/SillyQ2_20150420T1356_edit")
        {
            console.log("GET: /SillyQ2_20150420T1356");
            file.serveFile('/SillyQ2_20150420T1356.html', 200, {}, req, res);
        }
        else if (req.url === "/SillyQ2_20150420T1356")
        {
            console.log("GET: /SillyQ2_20150420T1356");
            file.serveFile('/SillyQ2_20150420T1356.html', 200, {}, req, res);
        }
        else if (req.url === "/DoublesQ1_20150327T0909")
        {
            console.log("GET: /DoublesQ1_20150327T0909");
            file.serveFile('/DoublesQ1_20150327T0909.html', 200, {}, req, res);
        }
        else
        {
            console.log("GET: " + req.url + " SEND FILE!");
            file.serve(req, res);
        }
    }
    else if (req.method === "POST")
    {
        console.log("POST");
        if (req.url === "/api/savebracket/SillyQ2_20150420T1356")
        {
            console.log("POST:/api/savebracket/SillyQ2_20150420T1356");
            var reqBody = '';
            req.on('data', function(data)
            {
                console.log("POST:/api/savebracket/SillyQ2_20150420T1356 (data)");
                reqBody += data;
            });
            req.on('end', function()
            {
            	var fileData = "var bigData = " + reqBody + ";";

                console.log("POST:/api/savebracket/SillyQ2_20150420T1356 (end) - \n" + fileData);

                fs.writeFile('/home/vagrant/src/data/SillyQ2_20150420T1356.js', fileData, function (err) {
                    if (err) throw err;
                    console.log('It\'s saved!');
                    res.writeHead(200, {'Content-Type': 'text/plain'});
                    res.end("okay");
                });
            });
        }
        else
        {
            console.log("POST:other - " + req.url);
        }
    }
    else
    {
        console.log("OTHER METHOD");
        res.writeHead(405, 'Method Not Supported', {'Content-Type': 'text/html'});
        res.end('<!doctype html><html><head><title>405</title></head><body>405: Method Not Supported</body></html>');
    }
}).listen(3000);
console.log('Server running at http://127.0.0.1:3000/');

