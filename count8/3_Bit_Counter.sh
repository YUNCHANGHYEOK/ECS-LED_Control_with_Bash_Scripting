#!/usr/bin/bash

# GPIO 핀 번호 설정
gpio_bit0=18  # LSB (1의 자리)
gpio_bit1=23  # Middle bit (2의 자리)
gpio_bit2=24  # MSB (4의 자리)

# 핀 출력 모드 설정
for gpio in $gpio_bit0 $gpio_bit1 $gpio_bit2; do
    pinctrl set $gpio op
done

# 무한 루프 시작
while true; do
    for value in {0..7}; do
        # 비트 값 계산
        bit0=$(( value % 2 ))               # 1의 자리
        bit1=$(( (value / 2) % 2 ))          # 2의 자리
        bit2=$(( (value / 4) % 2 ))          # 4의 자리

        # LED 제어: 값에 따라 dh 또는 dl
        pinctrl set $gpio_bit0 $( [ $bit0 -eq 1 ] && echo dh || echo dl )
        pinctrl set $gpio_bit1 $( [ $bit1 -eq 1 ] && echo dh || echo dl )
        pinctrl set $gpio_bit2 $( [ $bit2 -eq 1 ] && echo dh || echo dl )

        sleep 1
    done
done