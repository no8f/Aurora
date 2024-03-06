#!/bin/sh

symbol() {
    if [ $(nmcli -t -f TYPE connection show --active | grep 'wireless') != "" ]; then
        local strength=$(iwconfig wlan0 | awk '/Signal level/{print $4}' | cut -d= -f2)
        if [[ "$strength" -gt -50 ]]; then
            echo "󰤨"  # WiFi icon indicating strong signal
        elif [[ "$strength" -gt -70 ]]; then
            echo "󰤢"  # WiFi icon indicating medium signal
        else
            echo "󰤟"  # WiFi icon indicating weak signal
        fi
    elif ifconfig eth0 &> /dev/null; then
        echo "󰈀"  # Ethernet icon
    else
        echo "󰤮"  # No connection icon
    fi
}

name() {
  echo $(nmcli -t -f active,ssid dev wifi | grep ja | cut -d':' -f2)
}

ip() {
 echo $(nmcli -p -f IP4.ADDRESS dev show | grep -v 127.0.0.1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')
}

[ "$1" = "icon" ] && symbol && exit
[ "$1" = "name" ] && name && exit
[ "$1" = "ip" ] && ip && exit
