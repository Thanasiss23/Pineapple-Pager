#!/bin/bash
# Title: Disco Pager Mode
# Author: Thanasis
# Description: Cycles LEDs and beeps until manually stopped.

LOG blue "DISCO MODE ACTIVATED"
LOG "Press Ctrl+C or Stop in Pager to exit."

# Ξεκινάει το ατέρμονο loop
while true
do
    # 1. LED Πράσινο & Ήχος
    LED GREEN
    BUZZER 1
    LOG green "LED: GREEN | BEEP"
    sleep 1

    # 2. LED Κίτρινο & Ήχος
    LED YELLOW
    BUZZER 1
    LOG yellow "LED: YELLOW | BEEP"
    sleep 1

    # 3. LED Κόκκινο & Ήχος
    LED RED
    BUZZER 1
    LOG red "LED: RED | BEEP"
    sleep 1
done
