#!/bin/bash
# Title: Auto Network Scanner
# Author: Thanasis

LOG blue "=== STARTING NETWORK AUDIT ==="

# 1. External Check
MY_IP=$(curl -s ifconfig.me)
LOG yellow "Public IP: $MY_IP"

# 2. Local Discovery
# Βρίσκουμε το subnet αυτόματα
LOCAL_SUBNET=$(ip route | grep -v default | awk '{print $1}' | head -n 1)
LOG blue "Scanning Subnet: $LOCAL_SUBNET"

ACTIVE_IPS=$(nmap -sn "$LOCAL_SUBNET" | grep "Nmap scan report for" | awk '{print $NF}' | tr -d '()')

for ip in $ACTIVE_IPS
do
    LOG "------------------------------"
    LOG green "DEVICE FOUND: $ip"
    
    # Port Scan
    SCAN_RESULT=$(nmap -Pn -F "$ip")
    
    # Αν βρει ανοιχτές θύρες, τις δείχνει
    OPEN_PORTS=$(echo "$SCAN_RESULT" | grep "/tcp" | grep "open")
    if [ -n "$OPEN_PORTS" ]; then
        LOG "Ports: $OPEN_PORTS"
    fi
    
    # Έλεγχος για TV Box / Cast
    if echo "$SCAN_RESULT" | grep -q "8008/tcp"; then
        NAME=$(curl -s --connect-timeout 2 "http://$ip:8008/setup/eureka_info" | grep -o '"name":"[^"]*"' | cut -d'"' -f4)
        LOG cyan "IDENTITY: $NAME"
    fi
done

LOG blue "=== AUDIT COMPLETE ==="
PROMPT "Scan Finished. Check logs for details."
