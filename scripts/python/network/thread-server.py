#!/usr/bin/env python3

import socketserver
import time
from threading import Thread

#TODO: Other handlers - https://docs.python.org/2/library/socketserver.html
class MyHandler(socketserver.StreamRequestHandler):
  def handle(self):
    msg = str(self.client_address)
    print(msg)
    #print("%s connected" %(msg.decode('utf-8')))
    data = self.rfile.readline().strip()
    print("Received %s",data)
    msg = "Got response, wait for it ...\n"
    self.wfile.write(msg.encode('utf-8'))
    time.sleep(5)
    msg = "Completed request\n"
    self.wfile.write(msg.encode('utf-8'))


class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
  pass


PORT = 9091
socketserver.TCPServer.allow_reuse_address = True

t = ThreadedTCPServer(("",PORT),MyHandler)
print("Serving on port %s" %(PORT))
t.serve_forever()



