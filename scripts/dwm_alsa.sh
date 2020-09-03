#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
	#echo ""
	#timeTemp= acpi | awk '{print $5}'
	#time=${timeTemp%????}


    str=$(amixer get Master | tail -n1)
    OnOrOff=$( echo "$str" | sed -r "s/.*\[(.*)\].*/\1/")
    VOL=$( echo "$str" | sed -r "s/.*\[(.*)%\].*/\1/")

    if [ "$OnOrOff" = "off" ]; then
        printf "🔇 %s%%" "$VOL"
    else
        if [ "$VOL" -eq 0 ]; then
            printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "🔈 %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "🔉 %s%%" "$VOL"
        else
            printf "🔊 %s%%" "$VOL"
        fi
    fi
}

dwm_alsa
