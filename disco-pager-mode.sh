Αυτό το DuckyScript Payload χρησιμοποιεί μια ατελείωτη επανάληψη (loop) για να αναβοσβήνει κυκλικά τα 3 ενδεικτικά LED του Pager και να εκπέμπει έναν ήχο (buzzer) σε κάθε αλλαγή, με συχνότητα 1 δευτερόλεπτο.


# Payload Title: Disco_Pager_Mode.sh
# Target: WiFi Pineapple Pager

# Χρησιμοποιούμε ένα ατελείωτο loop (while true) για συνεχή επανάληψη

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

# Τι σημαίνουν τα LEDs:
# Το Pager έχει ένα μόνο tri-color LED (συνήθως LED 1)
# 0: Off
# 1: Red
# 2: Yellow
# 3: Green
# Εδώ χρησιμοποιούμε τα χρώματα (RED, YELLOW, GREEN) για να είναι πιο ευανάγνωστο.
