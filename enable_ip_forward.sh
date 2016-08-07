#!/bin/bash
#enable ip forwarding
echo "Enabling Ip forwarding.."
#keno prin kai meta ta {}
echo 1 > /proc/sys/net/ipv4/ip_forward || { echo -e "could not enable ip forwarding. Exiting\n"; exit 1; }
echo -e "ip forward enabled. Cating file\n"
cat /proc/sys/net/ipv4/ip_forward
echo -e "\n"

