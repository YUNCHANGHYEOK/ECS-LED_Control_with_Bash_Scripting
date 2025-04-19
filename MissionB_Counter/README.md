# gpiozero 예제 모음

이 문서는 gpiozero 라이브러리를 활용한 4가지 예제를 설명합니다. 각 예제는 LED와 버튼의 기본적인 동작을 확인할 수 있도록 작성되었습니다.

---
## 영상 모음
📺 시연 영상 1  
<a href="https://youtu.be/5DwHgjO_Xms"> <img src="https://img.youtube.com/vi/5DwHgjO_Xms/hqdefault.jpg" width="600px"> </a>  
📺 시연 영상 2  
<a href="https://youtu.be/sw_NHpt55p4"> <img src="https://img.youtube.com/vi/sw_NHpt55p4/hqdefault.jpg" width="600px"> </a>  
📺 시연 영상 3  
<a href="https://youtu.be/Hy4cvKNfhfY"> <img src="https://img.youtube.com/vi/Hy4cvKNfhfY/hqdefault.jpg" width="600px"> </a>  
📺 시연 영상 4  
<a href="https://youtu.be/Bx_S9CV8yT4"> <img src="https://img.youtube.com/vi/Bx_S9CV8yT4/hqdefault.jpg" width="600px"> </a>  
---

## 예제 1: 버튼 누름/땔 때 LED 켜기/끄기
설명:
버튼이 눌렸을 때 모든 LED를 켜고, 버튼에서 손을 뗐을 때 LED를 끄는 기능을 수행합니다.

코드:

```python
from gpiozero import LED, Button
from signal import pause

# LED 핀 설정
leds = [LED(pin) for pin in [23, 24, 25, 8]]
# 버튼 초기화 (pull-up 모드)
button = Button(7, pull_up=True)

# 버튼 이벤트에 람다 함수 할당
button.when_pressed = lambda: [led.on() for led in leds]
button.when_released = lambda: [led.off() for led in leds]

pause()
```


## 예제 2: LED 상태 토글
설명:
버튼을 누르면 각 LED의 상태를 토글합니다. (켜져 있으면 끄고, 꺼져 있으면 켭니다.)

코드:
```python
from gpiozero import LED, Button
from signal import pause

# LED 핀 설정
leds = [LED(pin) for pin in [23, 24, 25, 8]]
button = Button(7, pull_up=True)

button.when_pressed = lambda: [led.toggle() for led in leds]

pause()
```

## 예제 3: LED 점멸 (딜레이 포함)
설명:
버튼을 누르면 모든 LED가 켜진 후 0.2초 딜레이 후 꺼지는 효과를 줍니다.

코드:
```python
from gpiozero import LED, Button
from signal import pause
from time import sleep

# LED 핀 설정
leds = [LED(pin) for pin in [23, 24, 25, 8]]
button = Button(7, pull_up=True)

button.when_pressed = lambda: [led.on() or sleep(0.2) or led.off() for led in leds]

pause()
```

## 예제 4: 이진수 카운터 LED

**설명:**  
버튼을 누를 때마다 전역 변수 `counter`가 0부터 15까지 증가하며, 각 LED에 이진수 값을 표시합니다.  
(LED는 LSB → MSB 순서로 출력합니다.)

**코드:**

```python
from gpiozero import LED, Button
from signal import pause

# LED 핀 설정 (LSB → MSB)
leds = [LED(pin) for pin in [23, 24, 25, 8]]
button = Button(7, pull_up=True)

counter = 0

def update():
    global counter
    # 각 LED에 counter의 비트값을 출력
    for i, led in enumerate(leds):
        led.value = (counter >> i) & 1
    counter = (counter + 1) % 16  # 0~15까지 순환

button.when_pressed = update

pause()
```

