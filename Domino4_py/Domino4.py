from gpiozero import LED
from time import sleep

leds = [LED(pin) for pin in [23, 24, 25, 8]]

while True:
    for led in leds:
        led.on()
        sleep(1)
        led.off()
