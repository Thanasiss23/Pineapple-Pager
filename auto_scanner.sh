#!/bin/sh

REPORT="network_audit.txt"

{
echo "=========================================="
echo "FULL NETWORK AUDIT: $(date)"
echo "=========================================="

# 1. Εξωτερικός Έλεγχος
MY_IP=$(curl -s ifconfig.me)
echo "[+] Checking Public IP: $MY_IP"
nmap -Pn -F $MY_IP
echo "------------------------------------------"

# 2. Ανακάλυψη Εσωτερικών Συσκευών
echo "[+] Scanning Local Network for active hosts..."
# Παίρνουμε μόνο τις IP διευθύνσεις από το nmap
ACTIVE_IPS=$(nmap -sn 192.168.1.0/24 | grep "Nmap scan report for" | awk '{print $NF}' | tr -d '()')

for ip in $ACTIVE_IPS
do
    echo "[*] Analyzing Device: $ip"
    
    # Γρήγορο scan στις βασικές θύρες της συσκευής
    SCAN_RESULT=$(nmap -Pn -F $ip)
    echo "$SCAN_RESULT" | grep "/tcp"
    
    # Ειδικός έλεγχος αν είναι Google/Cast συσκευή (θύρα 8008)
    if echo "$SCAN_RESULT" | grep -q "8008/tcp"; then
        NAME=$(curl -s --connect-timeout 2 http://$ip:8008/setup/eureka_info | grep -o '"name":"[^"]*"' | cut -d'"' -f4)
        if [ -z "$NAME" ]; then NAME="Unknown Cast Device"; fi
        echo "    >>> Identity: $NAME"
    fi
    echo "------------------------------------------"
done

echo -e "AUDIT COMPLETE\n"
} | tee -a $REPORT
