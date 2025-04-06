# 🧩 Mission A - LED Domino (with Raspberry Pi & Bash Script)

## 📜 과제 설명
4개의 LED를 이용하여 LED가 도미노처럼 순차적으로 켜지고 꺼지는 시스템을 구현합니다.  
Bash 스크립트(`domino4`)를 작성하여 Raspberry Pi의 GPIO 핀을 통해 LED를 제어합니다.

<img src="https://github.com/user-attachments/assets/f4f5951a-828a-4456-99e0-8a63a726f78e" width="600px">

## 📺 Youtube 시연 영상 (사진을 클릭하면 영상 재생)

<a href="https://youtu.be/-sEwysj2Gdg">
  <img src="https://img.youtube.com/vi/-sEwysj2Gdg/hqdefault.jpg" width="600px">
</a>

---

## 🧠 프로젝트 소개

이 프로젝트는 **Raspberry Pi**의 GPIO 핀과 **bash 스크립트**를 활용하여  
4개의 LED를 도미노처럼 순차적으로 켜고 끄는 LED 제어 시스템입니다.

스크립트를 실행하면 4개의 LED가 1초 간격으로 순서대로 켜졌다가 꺼지며,  
이를 반복하여 도미노처럼 점등 효과를 냅니다.

---

## 📦 주요 기능 요약

- 🟢 **4개의 LED 제어**
- ⏱ **1초 간격 LED ON/OFF**
- 🔁 **순차 점등 및 소등 반복 (도미노 효과)**
- 📷 **Raspberry Pi GPIO 핀을 통한 LED 제어**
- 🖥️ **Bash 스크립트로 간단하게 실행**

---

## 📸 기술 스택

- **Raspberry Pi** – GPIO 제어
- **bash script** – 제어 스크립트
- **pinctrl** – GPIO 핀 상태 설정

---

## ✅ 핀 구성 및 역할 안내

| 핀 번호  | 역할            | 설명 |
|--------|----------------|------|
| **GPIO 18** | LED 1 | 첫 번째 LED |
| **GPIO 23** | LED 2 | 두 번째 LED |
| **GPIO 24** | LED 3 | 세 번째 LED |
| **GPIO 25** | LED 4 | 네 번째 LED |

---

## 🧩 회로 구성 및 설명

회로는 Raspberry Pi의 GPIO 핀을 통해 4개의 LED를 제어합니다.

- 각 LED는 **330Ω 저항**을 거쳐 브레드보드의 GND에 연결
- GPIO 핀이 HIGH 출력 상태가 되면 전류가 흐르며 LED가 점등

### 💡 회로도

<img src="https://github.com/user-attachments/assets/73bb7308-16e5-447e-959f-19cbc6b161ca" width="600px">

---

## 🖥️ 스크립트 코드

### 📋 전체 코드

```bash
#!/usr/bin/bash

# 사용할 GPIO 핀 번호
pin1=18
pin2=23
pin3=24
pin4=25

# 모든 핀을 출력 모드(op)로 설정
for pin in $pin1 $pin2 $pin3 $pin4; do
    pinctrl set $pin op
done

# LED 도미노 점등 (무한 루프)
while true; do
    # 순차적으로 LED 켜고 끄기
    for pin in $pin1 $pin2 $pin3 $pin4; do
        pinctrl set $pin dh  # LED ON
        sleep 1
        pinctrl set $pin dl  # LED OFF
    done
done
```
---

## 🧩 코드 설명

- ```#!/usr/bin/bash``` : bash 스크립트로 실행하는 선언

- GPIO 핀 설정 : ```pin1=18, pin2=23, pin3=24, pin4=25```

- 핀 출력 모드 설정 : ```pinctrl set <gpio> op``` → 핀을 출력 모드로 전환

- 무한 루프 + 순차 점등 : ```while true; do``` → 무한 루프 / ```for pin in $pin1 $pin2 $pin3 $pin4; do``` → 4개의 핀을 순서대로 실행

- LED 제어 : 
  - ```pinctrl set $pin dh``` → LED ON
  - ```sleep 1``` → 1초 대기
  - ```pinctrl set $pin dl``` → LED OFF


---
## ✨ 주요 기능 상세

1. 도미노 효과 - 4개의 LED를 순차적으로 점등하고 소등하여 도미노처럼 자연스럽게 전환

2. 간편한 스크립트 실행 - 간단한 bash 스크립트 실행으로 사용 가능  
   pinctrl 명령어를 통해 GPIO 핀 상태를 제어

3. Raspberry Pi GPIO 제어 - GPIO 핀 상태에 따라 LED가 ON/OFF 됩니다.


---
## 🚀 사용 방법
회로를 브레드보드에 구성합니다.

Raspberry Pi 터미널에서 스크립트 파일에 실행 권한을 부여합니다.

```chmod +x LED_Domino.sh```
스크립트를 실행합니다.

```./LED_Domino.sh```
LED가 0부터 7까지 이진수로 순차 점등됩니다.

예:

0 → 모두 꺼짐

1 → GPIO 18 켜짐

2 → GPIO 23 켜짐

3 → GPIO 18, GPIO 23 켜짐

...

7 → 모든 LED 켜짐

## 🖼️ 예시 시각 자료 (세로 표 스타일)

| 숫자 (10진수) | LED (이진수) | LED 상태 |
|-------------|-------------|-----------|
| 0           | 000         | ○○○ |
| 1           | 001         | ○○● |
| 2           | 010         | ○●○ |
| 3           | 011         | ○●● |
| 4           | 100         | ●○○ |
| 5           | 101         | ●○● |
| 6           | 110         | ●●○ |
| 7           | 111         | ●●● |

- ● : 켜짐
- ○ : 꺼짐


