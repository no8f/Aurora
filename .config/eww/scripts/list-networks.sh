echo $(nmcli -f SSID device wifi list | grep -v "^SSID" | awk '!seen[$0]++' | jq -R -s 'split("\n")[:-1]'
)