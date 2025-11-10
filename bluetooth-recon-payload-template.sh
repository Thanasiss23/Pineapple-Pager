# Payload Title: BT_RECON_SCANNER.sh
# DuckyScript/Bash for WiFi Pineapple Pager

# 1. Καθαρισμός/Προετοιμασία
BASH rm -f /root/loot/bluetooth_targets.txt # Καθαρίζει προηγούμενα logs
BASH echo "--- New Bluetooth Scan Started ---" > /root/loot/bluetooth_targets.txt

# 2. Ενεργοποίηση Bluetooth Scan (Bash Command)
# Χρησιμοποιεί το "hcitool" για να βρει συσκευές (κλασικό BT)
BASH hcitool lescan --passive & # Ενεργοποιεί παθητική σάρωση BTLE στο background
BASH hcitool scan >> /root/loot/bluetooth_targets.txt & # Σάρωση κλασικού Bluetooth

# 3. Περίοδος Αναμονής (Recon Time)
# Δίνει 45 δευτερόλεπτα για να συλλεχθούν αποτελέσματα
SLEEP 45

# 4. Τερματισμός Σάρωσης
# Στέλνει σήμα τερματισμού στις background διεργασίες
BASH killall hcitool

# 5. Καθαρισμός & Εξαγωγή Μοναδικών Συσκευών (Bash Command)
# Χρησιμοποιεί grep και sort για να βρει μοναδικές MAC και Ονόματα
BASH cat /root/loot/bluetooth_targets.txt | grep -E "(\w{2}:\w{2}:\w{2}:\w{2}:\w{2}:\w{2})" | sort -u >> /root/loot/unique_bt_loot.txt

# 6. Ειδοποίηση Pager (DuckyScript)
# Ειδοποιεί τον χρήστη ότι η συλλογή ολοκληρώθηκε
BUZZER 1
LED 1 YELLOW
VIBRATE 2
