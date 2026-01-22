# Payload Title: Disco_Pager_Mode.sh
# Target: WiFi Pineapple Pager

WHILE TRUE
    # 1. LED Πράσινο
    LED 1 GREEN
    BUZZER 1      # Σύντομος ήχος
    SLEEP 1

    # 2. LED Κίτρινο
    LED 1 YELLOW
    BUZZER 1
    SLEEP 1

    # 3. LED Κόκκινο
    LED 1 RED
    BUZZER 1
    SLEEP 1
END_WHILE
