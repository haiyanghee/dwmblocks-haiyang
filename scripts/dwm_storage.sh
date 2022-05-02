#!/bin/sh

#display used/total
#STO=$(df -h | grep '/nvme0n1p5' | awk '{printf "%s/%s %s", $3, $2, $5}')

#display available
STO=$(df -h | grep '/nvme0n1p5' | awk '{printf "%s", $4}')

printf "💽:%s" "$STO"
