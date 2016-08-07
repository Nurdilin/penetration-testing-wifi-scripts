#!/bin/bash
#usage: change_MAC.sh interface MAC
if [ -z "$1" ]; then
   echo "please specify an ineterface"
   exit 1
fi

ifconfig | grep HWaddr 
ifconfig | grep inet
echo -e "\n"

ifconfig $1 down
echo brought interface $1 down

if [ -z "$2" ]; then
    ifconfig $1 hw ether 00:01:02:03:04:05
else
    ifconfig $1 hw ether $2
fi

echo changing MAC...

ifconfig $1 up
echo brought interface $1 up

echo -e "\n"
ifconfig | grep  HWaddr

echo -e "releasing IP...\n"

dhclient -r $1 &&

echo -e "requesting new IP\n" &&

dhclient $1 &&

echo -e "\n" &&

ifconfig | grep inet

