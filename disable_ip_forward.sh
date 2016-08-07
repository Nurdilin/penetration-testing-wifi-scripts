#!/bin/bash

#disable ip forwarding
echo "Disabling Ip forwarding.."
#keno prin kai meta ta {}
echo 0 > /proc/sys/net/ipv4/ip_forward || { echo -e "could not disable ip forwarding. Exiting\n"; exit 1; }
echo -e "ip forward disabled. Cating file\n"
cat /proc/sys/net/ipv4/ip_forward
echo -e "\n"

