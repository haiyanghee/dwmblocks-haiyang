#!/bin/sh
STO=$(df -h | grep '/nvme0n1p5' | awk '{printf "%s/%s %s", $3, $2, $5}')
printf "STO:%s" "$STO"
