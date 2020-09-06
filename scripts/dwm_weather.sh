#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city

location="卡尔加里"

getweather(){
	#[ "$(stat -c %y "$HOME/.local/share/weatherreport" 2>/dev/null | cut -d' ' -f1)" != "$(date )" ] &&
		ping -q -c 1 1.1.1.1 >/dev/null &&
		#curl -s wttr.in/Calgary?format=4 > "$HOME/.local/share/weatherreport"
		curl -s "zh.wttr.in/$location" > "$HOME/.local/share/weatherreport" 
		curl -s "zh.wttr.in/$location?format=4" >> "$HOME/.local/share/weatherreport" 
		notify-send "🌞 Weather" "New weather forecast for today."
}

dwm_weather() {
	stat=""
        #printf "[%s]\n" "$(curl -s wttr.in/$LOCATION?format=1)"
		#print name of city
		#sed '1q;d' "$HOME/.local/share/weatherreport" | awk '{print $3;}'| tr ',' ' ' | sed 's/^[ \t]*//;s/[ \t]*$//' 
		sed '41q;d' "$HOME/.local/share/weatherreport"  &&
		#echo ":"
		#print name of city and its current temp
		#sed '4q;d' "$HOME/.local/share/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print $1 "°","〰️",$2 "°"}' | tr '\n' ' ' &&
		#print largest possibility of raining 
		sed '16q;d' "$HOME/.local/share/weatherreport" | grep -wo "[0-9]*%" | sort -n | sed -e '$!d' | sed -e "s/^/☔ /g" | tr -d '\n' &&
		#print low and high 
		sed '13q;d' "$HOME/.local/share/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " 🥶",$1 "°","🌞",$2 "°"}' &&
		#sed '13q;d' "$HOME/.local/share/weatherreport" | grep -o "m\\(-\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " ",$1 "°","",$2 "°"}' &&
		echo $stat && echo "$delim"
        #update dwmblocks, weather is signal 5
        #pkill -RTMIN+5 dwmblocks 
}

getweather
dwm_weather
