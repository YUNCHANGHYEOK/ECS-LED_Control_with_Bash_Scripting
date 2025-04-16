from gpiozero import LED, Button
from signal import pause

# LED 핀
leds = [LED(pin) for pin in [23, 24, 25, 8]]

# 버튼
button = Button(7, pull_up=True)

# 버튼 이벤트에 직접 람다 함수 할당
button.when_pressed = lambda: [led.on() for led in leds]
button.when_released = lambda: [led.off() for led in leds]

pause()
