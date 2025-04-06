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
