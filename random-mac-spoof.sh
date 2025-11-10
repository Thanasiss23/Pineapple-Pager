# random-mac-spoof.sh
# Target Interface (WLAN1, συνήθως το interface επίθεσης του Pager)
INTERFACE="wlan1"
OUI_FILE="/root/payloads/data/legit-ouis.txt"

# 1. Ενεργοποιούμε το τυχαίο (RANDOM)
# (Απαραίτητο για τη σωστή λειτουργία του $RANDOM στο Bash)

# 2. Επιλογή Τυχαίας Γραμμής
# Μετράμε τον αριθμό των γραμμών με OUI (εξαιρούμε τα σχόλια #)
NUM_OUI=$(grep -v '#' "$OUI_FILE" | wc -l)
# Επιλέγουμε τυχαία έναν αριθμό από 1 μέχρι τον αριθμό των OUI
RANDOM_LINE=$(( ($RANDOM % $NUM_OUI) + 1 ))

# 3. Εξαγωγή του OUI
# Χρησιμοποιούμε sed για να πάρουμε την τυχαία γραμμή
NEW_OUI=$(grep -v '#' "$OUI_FILE" | sed -n "${RANDOM_LINE}p")

# 4. Δημιουργία των Τυχαίων Τριών Τελευταίων Οκτάδων
# Δημιουργούμε τρεις τυχαίους αριθμούς σε δεκαεξαδική μορφή (00-FF)
RANDOM_END=$(printf ':%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))

# 5. Καθορισμός της Τελικής MAC
NEW_MAC="${NEW_OUI}${RANDOM_END}"

# 6. Εφαρμογή MAC Spoofing (OpSec Action)
BASH echo "Applying MAC Spoofing on $INTERFACE..."
BASH echo "New MAC Address: $NEW_MAC"

# Κατεβάζουμε το interface
ifconfig "$INTERFACE" down

# Αλλάζουμε τη MAC Address
macchanger -m "$NEW_MAC" "$INTERFACE"

# Ανεβάζουμε το interface
ifconfig "$INTERFACE" up

BASH echo "MAC Spoofing Complete. OpSec Enhanced."
