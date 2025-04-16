from gpiozero import LED, Button
from signal import pause

leds = [LED(pin) for pin in [23, 24, 25, 8]]
button = Button(7, pull_up=True)

button.when_pressed = lambda: [led.toggle() for led in leds]

pause()
