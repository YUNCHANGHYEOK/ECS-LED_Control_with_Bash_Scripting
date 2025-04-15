from gpiozero import LED
from time import sleep

leds = [LED(23), LED(24), LED(25)]  # LSB → MSB

while True:
    for value in range(8):
        [led.on() if value & (1 << i) else led.off() for i, led in enumerate(leds)]
        sleep(1)
