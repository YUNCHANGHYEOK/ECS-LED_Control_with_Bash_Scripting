from gpiozero import LED, Button
from signal import pause

leds = [LED(pin) for pin in [23, 24, 25, 8]]  # LSB → MSB
button = Button(7, pull_up=True)

counter = 0

def update():
    global counter
    for i, led in enumerate(leds):
        led.value = (counter >> i) & 1
    counter = (counter + 1) % 16

button.when_pressed = update

pause()
