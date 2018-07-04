#!/bin/bash
#created by TheBigMonkey
#Generates QRCode from clipbord Compatible with barcodescanner on Android.
#Requiers xclip and qrencode.
command -v qrencode >/dev/null 2>&1 || { echo "qrencode is required but not installed. Aborting." >&2; exit 1; }
command -v xclip >/dev/null 2>&1 || { echo "xclip is required but not installed. Aborting." >&2; exit 1; }
xclip -o | qrencode  -tANSI
read -n 1 -p "Press any key to continue..."
echo
clear
