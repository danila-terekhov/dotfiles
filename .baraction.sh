#!/usr/bin/env bash

bat() {
	bat=`cat /sys/class/power_supply/BAT0/capacity`
	if [ `cat /sys/class/power_supply/BAT0/status` == Charging ]; then bat="+${bat}" ; fi
	echo -e "BAT:${bat}%"
}
mem() {
	mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3/1024.0, $2/1024.0 }'`
	echo -e "MEM:$mem"
}


SLEEP_SEC=3

while :; do
	echo "$(bat) | $(mem)"
	sleep $SLEEP_SEC
done
