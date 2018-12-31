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
# -- Configure GPIO
# ------------------------------
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
for key in leds:
  GPIO.setup(leds[key],GPIO.OUT)

#for key in buttons:
#  GPIO.setup(buttons[key],GPIO.IN)


#GPIO.setup(buttons[BUTTON], GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
#GPIO.add_event_detect(buttons[BUTTON],GPIO.RISING,callback=button_callback)
# def button_callback:
#

# ------------------------------
# -- Program
# ------------------------------

#for key in leds:
#  print(GPIO.input(leds[key]))

bitmask = {}
bitmask[GREEN] = 0b1
bitmask[YELLOW] = 0b10
bitmask[RED] = 0b100

for i in range(0,4):
  for key in leds:
    value = False
    if i & bitmask[key]:
      value = True
    GPIO.output(leds[key], value)
  time.sleep(1)
