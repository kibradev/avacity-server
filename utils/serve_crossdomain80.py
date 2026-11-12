"""Serve /crossdomain.xml on port 80 for Flash policy checks.

Flash asks http://pnz-city.project/crossdomain.xml on port 80
even when the game itself is loaded from :8080.
"""
from http.server import BaseHTTPRequestHandler, HTTPServer

POLICY = b"""<?xml version="1.0" ?>
<cross-domain-policy>
    <allow-access-from domain="*" />
</cross-domain-policy>
"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.split("?", 1)[0] in ("/", "/crossdomain.xml"):
            self.send_response(200)
            self.send_header("Content-Type", "text/xml")
            self.send_header("Content-Length", str(len(POLICY)))
            self.end_headers()
            self.wfile.write(POLICY)
            return
        self.send_error(404)

    def log_message(self, fmt, *args):
        print("[%s] %s" % (self.log_date_time_string(), fmt % args))


if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", 80), Handler)
    print("Serving crossdomain.xml on http://0.0.0.0:80/")
    server.serve_forever()
