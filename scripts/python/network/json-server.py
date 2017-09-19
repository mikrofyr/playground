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
    msg = "<html><body><h3>JSON server, GET request.</h3></body></html>" self.wfile.write(msg.encode("utf-8"))
    print("%s:GET"  %(self.client_address[0]))

  def do_HEAD(self):
    self._set_headers()
  
  def do_POST(self):
    # Doesn't do anything with posted data
    self._set_headers()
    msg = "<html><body><h3>JSON server, POST request</h3></body></html>"
    self.wfile.write(msg.encode("utf-8"))
    tmp = self.rfile.read(int(self.headers['Content-Length']))
    print("%s:%s" %(self.client_address[0],tmp.decode("utf-8")))

  # Make quiet (XXX: Remove when debugging)
  #https://stackoverflow.com/questions/10651052/how-to-quiet-simplehttpserver
  def log_message(self, format, *args):
    a=1

PORT = 9090
socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
  print("serving at port", PORT)
  httpd.serve_forever()


