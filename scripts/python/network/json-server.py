#!/usr/bin/env python3

import http.server
import socketserver

class MyHandler(http.server.SimpleHTTPRequestHandler):
  def _set_headers(self):
    self.send_response(200)
    self.send_header('Content-type', 'text/html')
    self.end_headers()

  def do_GET(self):
    self._set_headers()
    msg = "<html><body><h2>Got GET!</h2></body></html>"
    self.wfile.write(mgs.encode("utf-8"))

  def do_HEAD(self):
    self._set_headers()
  
  def do_POST(self):
    # Doesn't do anything with posted data
    self._set_headers()
    msg = "<html><body><h2>Got POST!</h2></body></html>"
    self.wfile.write(msg.encode("utf-8"))
    tmp = self.rfile.read(int(self.headers['Content-Length']))
    print(tmp.decode("utf-8"))

PORT = 9090

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
  print("serving at port", PORT)
  httpd.serve_forever()


