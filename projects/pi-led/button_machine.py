#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

# ------------------------------
# -- Keys 
# ------------------------------
# Led
GREEN = 0
YELLOW = 1
RED = 2
# Button
BUTTON = 0

# ------------------------------
# -- LEDs 
# ------------------------------
leds = {}
leds[GREEN] = 17
leds[YELLOW] = 27 
leds[RED] = 22

# ------------------------------
# -- Button
# ------------------------------
buttons = {}
buttons[BUTTON] = 26

# ------------------------------
# -- Callback
# ------------------------------
mode = 0
def button_callback(arg):
  global mode
  mode += 1

# ------------------------------
# -- Configure GPIO
# ------------------------------
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
for key in leds:
  GPIO.setup(leds[key],GPIO.OUT)

for key in buttons:
  GPIO.setup(buttons[key], GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
  GPIO.add_event_detect(buttons[BUTTON], GPIO.RISING, callback=button_callback, bouncetime=300)

# ------------------------------
# -- Main loop
# ------------------------------
def set_led(a):
  global leds
  bitmask = {}
  bitmask[GREEN] = 0b1
  bitmask[YELLOW] = 0b10
  bitmask[RED] = 0b100

  for key in leds:
    state = False
    if a & bitmask[key]:
      state = True
    GPIO.output(leds[key], state)

def invert_led():
  global leds
  for key in leds:
    GPIO.output(leds[key], not GPIO.input(leds[key]))

def led_off():
  for key in leds:
    GPIO.output(leds[key], False)

cnt = 0

while True:
  if mode == 0:
    set_led(cnt)
    cnt += 1 
    time.sleep(1)
  elif mode ==1:
    invert_led()
    time.sleep(1)
  elif mode ==2:
    led_off()
    break

#message = input("Press enter to quit\n\n")
GPIO.cleanup()

