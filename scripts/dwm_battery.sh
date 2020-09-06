#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    #CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    #STATUS=$(cat /sys/class/power_supply/BAT0/status)

    #if [ "$IDENTIFIER" = "unicode" ]; then
    #    if [ "$STATUS" = "Charging" ]; then
    #        #printf "[🔌 %s%% %s]\n" "$CHARGE" "$STATUS"
    #        echo "[🔌 %s%% %s]\n" "$CHARGE" "$STATUS"
    #    else
    #        #printf "[🔋 %s%% %s]\n" "$CHARGE" "$STATUS"
    #        echo "🔋" "$CHARGE" "$STATUS"
    #    fi
    #else
    #    printf "[BAT %s%% %s]\n" "$CHARGE" "$STATUS"
    #fi



	#for x in /sys/class/power_supply/BAT?/capacity;
	#do
	#case "$(cat $x)" in
	#	100|9[0-9])	echo "" $CHARGE"%";;
	#	8[0-9]|7[0-9])	echo "" $CHARGE"%";;
	#	6[0-9]|5[0-9])	echo "" $CHARGE"%";;
	#	4[0-9]|3[0-9])	echo "" $CHARGE"%";;
	#			*)		echo "";;
	#esac
	#done && echo "$delim"

    # Loop through all attached batteries.

for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity 2>/dev/null) || break
	status=$(sed "s/[Dd]ischarging/🔋 /;s/[Nn]ot charging/🛑 /;s/[Cc]harging/🔌/;s/[Uu]nknown/♻️ /;s/[Ff]ull/⚡ /" "$battery"/status)
    batNumForACPI=$(echo "$battery" | sed "s/.*BAT/BAT/")
    batNumForACPI=$(echo "${batNumForACPI: -1}")
    #for acpi, it is displayed as "Battery i", where i is an integer
    batNumForACPI="Battery $batNumForACPI"
    timeRemain=$(acpi | grep "$batNumForACPI" |  awk '{print $5}')

	# If it is discharging and 25% or less, we will add a ❗ as a warning.
	 [ "$capacity" -le 25 ] && [ "$status" = "🔋 " ] && warn="❗ "

	printf "%s%s%s%% %s" "$status" "$warn" "$capacity" "$timeRemain"
	unset warn
done | sed 's/ *$//'

}

dwm_battery

