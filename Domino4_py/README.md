# 🧩 LED Domino with Raspberry Pi & gpiozero

### 📜 프로젝트 개요
이 프로젝트는 **Raspberry Pi**의 GPIO 핀과 **Python의 gpiozero 라이브러리**를 활용하여  
**4개의 LED를 도미노처럼 순차적으로 점등 및 소등**하는 시스템입니다.  

기존에는 Bash 스크립트 기반으로 `pinctrl` 명령어를 사용했지만,  
지금은 **Python 코드로 더 간결하고 직관적으로 개선**되었습니다.

---

### 🎯 주요 기능
- 🟢 4개의 LED 제어
- ⏱ 1초 간격으로 순차적인 ON/OFF
- 🔁 반복되는 도미노 점등 효과
- 🐍 Python 코드 기반 – 가독성 좋고 유지보수 쉬움
- 📷 gpiozero로 간단한 GPIO 제어

---

### 🔁 변경점 요약: Bash → Python + gpiozero

| 항목              | 기존 (Bash + pinctrl)                         | 변경 (Python + gpiozero)                    |
|-------------------|-----------------------------------------------|---------------------------------------------|
| 제어 방식         | Shell 명령어 기반 제어 (`pinctrl`)           | Python 객체 지향적 제어                     |
| 코드 길이         | 비교적 길고 반복 구조 필요                    | 짧고 간결한 구조                            |
| 라이브러리 필요   | pinctrl (외부 명령어)                         | gpiozero (pip로 설치 가능)                  |
| 확장성/유지보수   | 제한적 / 수정 어려움                         | 유연하고 가독성 좋음                        |
| 가시성            | 내부 상태 추적 어려움                         | 코드로 직접 상태 확인 가능                  |

> ✅ **한 줄 요약**: 더 짧고, 더 읽기 쉽고, 더 파이썬답게 개선됨!

---

### ⚙️ 핀 구성

| GPIO 핀 번호 | 역할      | 연결된 LED |
|--------------|-----------|------------|
| GPIO 23      | LED 1     | 첫 번째    |
| GPIO 24      | LED 2     | 두 번째    |
| GPIO 25      | LED 3     | 세 번째    |
| GPIO 8       | LED 4     | 네 번째    |

> 💡 실제 회로 구성 시 각 핀은 330Ω 저항을 거쳐 GND와 연결되어야 합니다.

---

### 🖥️ 코드

```python
from gpiozero import LED
from time import sleep

# GPIO 핀에 연결된 LED 리스트
leds = [LED(pin) for pin in [23, 24, 25, 8]]

# 무한 루프 도미노 효과
while True:
    for led in leds:
        led.on()
        sleep(1)
        led.off()
```
