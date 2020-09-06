#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {


    # Used and total memory
    #MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    #MEMTOT=$(free -h |awk '(NR == 2) {print $2}')

    MEM=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%2.2fGiB/%2.2fGiB\n", ( $3 / 1024), ($2 / 1024))}')
    # CPU temperature

	#For dell intel cpu:
	#cpuAll=$(sensors | grep "Core" | awk '{print $3}' | tr -d '°C+' | tr '\n' ' ' )
	#CPU1=$(echo $cpuAll | awk '{print $1}')
	#CPU2=$(echo $cpuAll | awk '{print $2}')
	#CPU3=$(echo $cpuAll | awk '{print $3}')
	#CPU4=$(echo $cpuAll | awk '{print $4}')

	#CPUTEMP=$(echo "($CPU1+$CPU2+$CPU3+$CPU4)"/4 |bc)

	#For thinkpad amd cpu:
	CPUTEMP=$(sensors | grep "Tdie" | awk '{print $2}' | tr -d '°C+')

	percent=$(mpstat | awk '{print $13}' | tr '\n' ' ' | awk '{print (100 - $2 ) "%"}')
	#percent=$(mpstat | awk '{print $4}' | tr '\n' ' ' | awk '{print $3 "%"}')

    # Used and total storage in /home (rounded to 1024B)
    #(storage will be printed separately in dwm_storage.sh, since storage rarely changes drastically)
    #STO=$(df -h | grep '/nvme0n1p5' | awk '{printf "%s/%s %s", $3, $2, $5}')

    #printf "MEM:%s|CPU:%s, %s°C|STO:%s" "$MEM" "$percent" "$CPUTEMP"  "$STO"
    printf "MEM:%s|CPU:%s, %s°C" "$MEM" "$percent" "$CPUTEMP"
}


dwm_resources
