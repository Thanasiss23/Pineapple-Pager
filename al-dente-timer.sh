#!/bin/bash
BASH echo "Press A for 10 min | Press B for 8 min"
LED 1 YELLOW  # Αναβοσβήνει κίτρινο για να δείξει αναμονή εισόδου

WHILE TRUE
    # 1. Trigger για 10 λεπτά (Classic Spaghetti)
    ON BUTTON_A_PRESSED
        SET cooking_time 600
        BREAK # Βγαίνει από το loop για να ξεκινήσει ο χρονοδιακόπτης
    END_ON

    # 2. Trigger για 8 λεπτά (Penne Rigate)
    ON BUTTON_B_PRESSED
        SET cooking_time 480
        BREAK # Βγαίνει από το loop για να ξεκινήσει ο χρονοδιακόπτης
    END_ON

    SLEEP 0.1 # Μικρή αναμονή για να μην καταναλώνεται CPU
END_WHILE

# 3. Εντολές Χρονόμετρου (Εκτελούνται μετά το BREAK)
LED 1 YELLOW
BUZZER 1
BASH echo "Timer Started: $cooking_time seconds."

SLEEP $cooking_time

# 4. Ειδοποίηση Ολοκλήρωσης
LED 1 RED
BUZZER 5
VIBRATE 5
LED 1 OFF
