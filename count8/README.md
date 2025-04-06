
# Mission B - 3비트 LED 카운터 (with Raspberry Pi & Bash Script)

## 📜 과제 설명
3 Bit LED Counter를 구현하는 과제입니다.  
Bash 스크립트(`count8`)를 작성하여 LED를 사용한 이진수 카운터를 구현합니다.
<img src="https://github.com/user-attachments/assets/96a0365e-a67f-4197-9cf0-e16ddb8f8061" width="600px">


## 📺 Youtube 시연 영상 (사진을 클릭하면 영상 재생)

<a href="https://youtu.be/a36LGcD0Ru4">
  <img src="https://img.youtube.com/vi/a36LGcD0Ru4/hqdefault.jpg" width="600px">
</a>


---

## 🧠 프로젝트 소개

이 프로젝트는 **Raspberry Pi**의 GPIO 핀과 **bash 스크립트**를 활용하여  
3개의 LED를 사용하여 **0부터 7까지의 숫자를 이진수로 표현하는 카운터 시스템**입니다.

스크립트를 실행하면 3개의 LED가 현재 숫자를 이진수로 표시하며,  
1초마다 숫자가 1씩 증가하면서 LED 상태가 변경됩니다.

---

## 📦 주요 기능 요약

- 🔢 **숫자 카운팅 (0~7)**
- 💡 **이진수 LED 표시 (3개의 LED로 표현)**
- ⏱ **1초마다 자동 카운팅**
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
| **GPIO 18** | LSB (1의 자리)    | 가장 작은 비트를 담당하는 LED |
| **GPIO 23** | Middle Bit (2의 자리) | 중간 비트를 담당하는 LED |
| **GPIO 24** | MSB (4의 자리)    | 가장 큰 비트를 담당하는 LED |

---

## 🧩 회로 구성 및 설명

회로는 Raspberry Pi의 GPIO 핀을 통해 3개의 LED를 제어합니다.

- 각 LED는 **330Ω 저항**을 거쳐 브레드보드의 GND에 연결
- GPIO 핀이 HIGH 출력 상태가 되면 전류가 흐르며 LED가 점등

### 💡 회로도

<img src="https://github.com/user-attachments/assets/93c0ee5c-4a5e-4043-bfc4-7ecf2e353d16" width="600px">




---

## 🖥️ 스크립트 코드

### 📋 전체 코드

```bash
#!/usr/bin/bash

# GPIO 핀 번호 설정
gpio_bit0=18  # LSB (1의 자리)
gpio_bit1=23  # Middle bit (2의 자리)
gpio_bit2=24  # MSB (4의 자리)

# 핀 출력 모드로 설정
for gpio in $gpio_bit0 $gpio_bit1 $gpio_bit2; do
    pinctrl set $gpio op
done

# 무한 루프 시작
while true; do
    for value in {0..7}; do
        # 비트 값 계산
        bit0=$(( value % 2 ))
        bit1=$(( (value / 2) % 2 ))
        bit2=$(( (value / 4) % 2 ))

        # LED 제어
        pinctrl set $gpio_bit0 $( [ $bit0 -eq 1 ] && echo dh || echo dl )
        pinctrl set $gpio_bit1 $( [ $bit1 -eq 1 ] && echo dh || echo dl )
        pinctrl set $gpio_bit2 $( [ $bit2 -eq 1 ] && echo dh || echo dl )

        sleep 1
    done
done
```
---

## 🧩 코드 설명
- ```#!/usr/bin/bash``` : bash 스크립트로 실행하는 선언

- GPIO 핀 설정 : ```gpio_bit0=18, gpio_bit1=23, gpio_bit2=24```

- 핀 출력 모드 설정 : ```pinctrl set <gpio> op``` → 핀을 출력 모드로 전환

- 무한 루프 + 카운팅 : ```while true; do``` → 무한 루프 / ```for value in {0..7}; do``` → 0~7까지 반복

- 비트 계산 : ```bit0, bit1, bit2``` → 숫자를 이진수로 분해

- LED 제어 : 비트가 1이면 ```dh``` (ON), 아니면 ```dl``` (OFF)

- sleep 1 : LED 상태 유지 후 1초 대기

---
## ✨ 주요 기능 상세

1. LED로 이진수 표시 숫자를 2진수로 변환 후 각 비트를 LED로 표현  
   0부터 7까지 1초마다 자동 증가

2. 간편한 스크립트 실행 - 간단한 bash 스크립트 실행으로 사용 가능  
   pinctrl 명령어를 통해 GPIO 핀 상태를 제어

3. Raspberry Pi GPIO 제어 - GPIO 핀 상태에 따라 LED가 ON/OFF 됩니다.


---
## 🚀 사용 방법
회로를 브레드보드에 구성합니다.

- Raspberry Pi 터미널에서 ```chmod +x count8.sh``` 를 이용해 스크립트 파일에 실행 권한을 부여합니다.  
- ```./count8.sh``` → 스크립트를 실행합니다.
- LED가 0부터 7까지 이진수로 순차 점등됩니다.

## 💡 LED 점등 예시

| 숫자 (10진수) | 상태 설명                 |
|-------------|--------------------------|
| 0           | 모두 꺼짐                 |
| 1           | GPIO 18 켜짐              |
| 2           | GPIO 23 켜짐              |
| 3           | GPIO 18, GPIO 23 켜짐     |
| 4           | GPIO 24 켜짐              |
| 5           | GPIO 18, GPIO 24 켜짐     |
| 6           | GPIO 23, GPIO 24 켜짐     |
| 7           | 모든 LED 켜짐             |


## 🖼️ 예시 시각 자료

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


