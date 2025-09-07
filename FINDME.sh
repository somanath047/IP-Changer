#!/bin/bash
# =========================================================
# FINDME - Virtual IP Changer (Educational Purpose Only)
# Author: somanath047
# GitHub: https://github.com/somanath047
# =========================================================

INTERFACE="wlan0"   # Change to your interface (check with: ip a)
BASE="192.168.1"    # Change to match your LAN subnet

# Banner
clear
echo "================================================="
echo "   🔥 FINDME - Virtual IP Changer 🔥"
echo "   Author  : somanath047"
echo "   GitHub  : https://github.com/somanath047"
echo "================================================="
echo "   ✅ Thank you for using my tool!"
echo "   ⚠️  Educational Purpose Only"
echo "================================================="
echo

# Help menu
if [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: FINDME"
    echo "Description: Rotates your local IP every second."
    echo "Options:"
    echo "  -h, --help    Show this help message"
    echo
    exit 0
fi

echo "[*] Starting FINDME on $INTERFACE..."
sleep 2

while true; do
    OCTET=$(( RANDOM % 253 + 2 ))
    NEW_IP="$BASE.$OCTET"

    sudo ip addr flush dev $INTERFACE
    sudo ip addr add $NEW_IP/24 dev $INTERFACE
    sudo ip link set $INTERFACE up

    echo "[+] Changed IP to: $NEW_IP"

    sleep 1
done
