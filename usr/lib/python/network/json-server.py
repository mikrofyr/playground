#!/usr/bin/env python3

import datetime
import http.server
import socketserver
import sys
import threading
import time

#TODO: Other handlers - https://docs.python.org/2/library/socketserver.html
class MyHandler(http.server.SimpleHTTPRequestHandler):
  def _set_headers(self):
    self.send_response(200)
    self.send_header('Content-type', 'text/html')
    self.end_headers()

  def do_GET(self):
    # - Reply
    self._set_headers()
    msg = "<html><body><h3>IpJobs monitor, GET request.</h3></body></html>"
    self.wfile.write(msg.encode("utf-8"))
    #print("%s sleeping" %(threading.currentThread().getName()))
    #time.sleep(5)
    #print("%s done" %(threading.currentThread().getName()))
    # - Handle
    ts = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
    print("%s:GET (%s)"  %(ts,self.client_address[0]))
    sys.stdout.flush()

  def do_HEAD(self):
    self._set_headers()
  
  def do_POST(self):
    # - Reply
    self._set_headers()
    msg = "<html><body><h3>JSON server, POST request</h3></body></html>"
    self.wfile.write(msg.encode("utf-8"))
    # - Handle
    data = self.rfile.read(int(self.headers['Content-Length']))
    ts = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())
    console = "%s:%s (%s)" %(ts,data.decode("utf-8"),self.client_address[0])
    print(console)
    sys.stdout.flush()

  # Override to disable default printing (comment out for debug)
  def log_message(self, format, *args):
    """Do nothing """

#Threaded server definition
class ThreadedHTTPServer(socketserver.ThreadingMixIn, http.server.HTTPServer):
  pass


PORT = 9090
socketserver.TCPServer.allow_reuse_address = True
server = ThreadedHTTPServer(("", PORT), MyHandler)
print("serving at port", PORT)
sys.stdout.flush()
server.serve_forever()


