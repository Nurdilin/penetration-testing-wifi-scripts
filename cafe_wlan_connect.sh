ifconfig wlan0 down
ifconfig wlan0 hw ether $1
ifconfig wlan0 up
#iw dev wlan0 connect "COSTA COFFEE"
iw dev wlan0 connect $2
dhclient wlan0
