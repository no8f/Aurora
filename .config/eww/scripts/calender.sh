#!/bin/bash

# URL des iCal-Kalenders
ICAL_URL="https://rapla.dhbw-karlsruhe.de/rapla?page=iCal&user=vollmer&file=tinf23b3"

# Heutiges Datum im Format JJJJMMTT
CURRENT_DATE=$(date +"%Y%m%d")

# Temporäre Datei für den heruntergeladenen Kalender
TEMP_FILE=$(mktemp)

add_hour() {
  local time=$1
  echo $(date -d "$time 1 hour" +"%H:%M")
}
# iCal-Kalender herunterladen
wget -qO "$TEMP_FILE" "$ICAL_URL"

# Termine für den aktuellen Tag extrahieren und ausgeben
echo $(awk -v date="$CURRENT_DATE" '
BEGIN {
FS=":"
}
{
  if ($1 == "DTSTART" && $2 ~ date) {
    start_time=substr($2, 10, 2) ":" substr($2, 12, 2)
    # Adjust the start time by adding one hour
    split(start_time, time, ":")
    time[1] = sprintf("%02d", (time[1] + 1) % 24)
    start_time = time[1] ":" time[2]
    start_found=1
    printf "$Start; %s|", start_time
  }
  if ($1 == "DTEND" && start_found) {
    end_time=substr($2, 10, 2) ":" substr($2, 12, 2)
    # Adjust the start time by adding one hour
    split(end_time, time, ":")
    time[1] = sprintf("%02d", (time[1] + 1) % 24)
    end_time = time[1] ":" time[2]

    printf "End; %s|", end_time
  }
  if ($1 == "SUMMARY" && start_found) {
    printf "Termin; %s|", $2
  }
  if ($1 == "LOCATION" && start_found) {
    printf "Ort; %s| ", $2
    start_found=0
  }
}
' "$TEMP_FILE" | jq -R 'split("|") | map(split(";") | {(.[0]): .[1]})')

echo $TODAYS_EVENST

# Temporäre Datei löschen
rm "$TEMP_FILE"

