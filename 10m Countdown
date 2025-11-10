Αυτό το script θα θέσει το Pager σε κατάσταση αναμονής για 10 λεπτά (600 δευτερόλεπτα) και, μόλις τελειώσει, θα εκτελέσει μια σειρά από ειδοποιήσεις.

# Payload Title: Al_Dente_Alert.sh
# Target: WiFi Pineapple Pager (Al Dente Timer)

# Ορισμός του χρόνου μαγειρέματος σε δευτερόλεπτα (10 λεπτά * 60 δευτερόλεπτα)
SET cooking_time 600

# 1. Ειδοποίηση Έναρξης
LED 1 YELLOW            # Το LED γίνεται κίτρινο για να δείξει ότι "τρέχει"
BUZZER 1                # Σύντομος ήχος για επιβεβαίωση έναρξης
VIBRATE 1               # Σύντομη δόνηση
BASH echo "Timer Started: 10 minutes for Al Dente."

# 2. Αντίστροφη Μέτρηση
SLEEP $cooking_time     # Το Pager "παγώνει" εδώ για 600 δευτερόλεπτα

# 3. Ειδοποίηση Ολοκλήρωσης ("Time's Up!")
LED 1 RED               # Το LED γίνεται ΚΟΚΚΙΝΟ (STOP!)
BUZZER 5                # Έντονος και παρατεταμένος ήχος (πιο επείγον από το BUZZER 1)
VIBRATE 5               # Δόνηση 5 φορές για μέγιστη ειδοποίηση
SLEEP 5                 # Κρατάμε το κόκκινο φως και τον ήχο για 5 δευτερόλεπτα

# 4. Καθαρισμός & Ολοκλήρωση
LED 1 OFF               # Σβήσιμο του LED
BASH echo "Al Dente! Drain the pasta immediately."
