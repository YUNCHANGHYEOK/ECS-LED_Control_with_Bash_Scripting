
# 🚦 Mission B - 3비트 LED 카운터 (with Raspberry Pi & Python gpiozero)

## 📜 과제 설명

3 Bit LED Counter를 구현하는 과제입니다.  
기존에는 Bash 스크립트로 구현하던 것을, 이제는 Python의 `gpiozero` 라이브러리를 활용하여  
더 간결하고 가독성 높은 코드로 이진수 LED 카운터를 구성합니다.

---

## 📺 Youtube 시연 영상

<a href="https://youtu.be/VkxRJS_qOUM">
  <img src="https://img.youtube.com/vi/VkxRJS_qOUM/hqdefault.jpg" width="600px">
</a>


---

## 🧠 프로젝트 소개

이 프로젝트는 Raspberry Pi의 GPIO 핀과 Python을 활용하여  
3개의 LED를 사용해 **0부터 7까지의 숫자를 이진수**로 표현하는 카운터 시스템입니다.

스크립트를 실행하면 3개의 LED가 현재 숫자를 이진수로 표시하며,  
1초마다 숫자가 1씩 증가하면서 LED 상태가 변경됩니다.

---

## 📦 주요 기능 요약

- 🔢 숫자 카운팅 (0~7)
- 💡 이진수 LED 표시 (3개의 GPIO 핀)
- ⏱ 1초마다 자동 카운팅
- 📷 Raspberry Pi GPIO 제어
- 🖥️ Python + gpiozero 기반 스크립트로 실행

---

## 📸 기술 스택

- Raspberry Pi – GPIO 제어
- Python 3.x – 메인 언어
- gpiozero – GPIO 라이브러리

---

## ✅ 핀 구성 및 역할 안내

| GPIO 핀 번호 | 역할           | 설명                           |
|--------------|----------------|--------------------------------|
| GPIO 23      | LSB (1의 자리) | 가장 작은 비트를 담당하는 LED |
| GPIO 24      | 중간 비트      | 2의 자리를 담당하는 LED       |
| GPIO 25      | MSB (4의 자리) | 가장 큰 비트를 담당하는 LED   |

---

## 🧩 회로 구성 및 설명

- Raspberry Pi의 GPIO 핀을 통해 3개의 LED를 제어합니다.
- 각 LED는 **330Ω 저항**을 거쳐 브레드보드의 GND에 연결합니다.
- GPIO 핀이 **HIGH 출력 상태**가 되면 전류가 흐르며 LED가 점등됩니다.

---

## 🖥️ Python 스크립트 코드 (📁 `3_Bit_Counter.py`)

```python
from gpiozero import LED
from time import sleep

leds = [LED(23), LED(24), LED(25)]  # LSB → MSB

while True:
    for value in range(8):
        [led.on() if value & (1 << i) else led.off() for i, led in enumerate(leds)]
        sleep(1)
