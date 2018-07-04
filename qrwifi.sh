#!/bin/bash
#created by TheBigMonkey
#Generates QRCode for wifi Compatible with barcodescanner on Android.
#Requiers zenity and qrencode.
command -v zenity >/dev/null 2>&1 || { echo "zenity is required but not installed. Aborting." >&2; exit 1;}
command -v qrencode >/dev/null 2>&1 || { echo "qrencode is required but not installed. Aborting." >&2; exit 1; }

ssid=$(zenity --entry --title="Qrencode Wifi" --text="Enter SSID:")
if [ -z "$ssid" ]; then zenity --error --text="ssid cannot be blank"; exit 0; fi

type=$(zenity --list --radiolist \
--title="Qrencode Wifi select security type" \
--column="Choose one" --column=Security FALSE wep TRUE WPA)
if [ -z "$type" ]; then zenity --error --text="Secutity type cannot be blank"; exit 0; fi

wifipass=$(zenity --entry --title="Qrencode Wifi" --text="Enter pass phrase:")
if [ -z "$wifipass" ]; then zenity --error --text="wifi cannot be blank"; exit 0; fi

datestamp=`date +%s`
if [ -z "$datestamp" ]; then zenity --error --text="WTF date command failed?"; exit 0; fi

qrencode -o ~/wifiqr-$datestamp.png "WIFI:S:$ssid;T:$type;P:$wifipass;;"
gnome-open ~/wifiqr-$datestamp.png
