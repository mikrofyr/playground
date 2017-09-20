#!/usr/bin/env python3

import socketserver
import time
from threading import Thread
import signal
import sys

#TODO: Other handlers - https://docs.python.org/2/library/socketserver.html
class MyHandler(socketserver.StreamRequestHandler):
  def setup(self):
    a = 1

  def handle(self):
    msg = str(self.client_address)
    print(msg)
    #print("%s connected" %(msg.decode('utf-8')))
    data = self.rfile.readline().strip()
    print("Received %s" %(data.decode('utf-8')))
    msg = "Got response, wait for it ...\n"
    self.wfile.write(msg.encode('utf-8'))
    time.sleep(5)
    msg = "Completed request\n"
    self.wfile.write(msg.encode('utf-8'))
  
  def finish(self):
    a = 1

#TODO: https://stackoverflow.com/questions/17667903/python-socket-receive-large-amount-of-data + sigint, and JSON
class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
  pass

class SignalHandler():
  #Handle Ctrl-C
  def __init__(self,ts):
    self.ts = ts

  def handle(self,signal, frame):
    print("\nClosing server ...")
    #self.ts.shutdown()
    self.ts.server_close()
    sys.exit(0)

PORT = 9091
socketserver.TCPServer.allow_reuse_address = True

#signal.pause()

t = ThreadedTCPServer(("",PORT),MyHandler)
sh = SignalHandler(t)
signal.signal(signal.SIGINT, sh.handle)
print("Serving on port %s" %(PORT))
t.serve_forever()





