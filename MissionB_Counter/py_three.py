from gpiozero import LED, Button
from signal import pause
from time import sleep

leds = [LED(pin) for pin in [23, 24, 25, 8]]
button = Button(7, pull_up=True)

button.when_pressed = lambda: [led.on() or sleep(0.2) or led.off() for led in leds]

pause()
