🍝 Payload: Al Dente Presets for 10m and 8m

Σε αυτό το σενάριο, το Pager δεν τρέχει την αντίστροφη μέτρηση αμέσως. Περιμένει τον χρήστη να πατήσει ένα πλήκτρο

Επεξήγηση:
Χρησιμοποιούμε ένα WHILE TRUE loop που περιέχει τα Alert Triggers (ON BUTTON_A_PRESSED).

Το Pager παραμένει σε κατάσταση αναμονής μέχρι να πατήσετε το πλήκτρο A (ορίζει 10 λεπτά) ή το πλήκτρο B (ορίζει 8 λεπτά).

Η εντολή BREAK σταματά το loop αναμονής και η εκτέλεση του script συνεχίζει με την αντίστροφη μέτρηση (SLEEP $cooking_time).



# Payload Title: Al_Dente_Presets.sh

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
