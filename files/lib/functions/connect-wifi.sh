#!/bin/sh
# Copyright (C) 2014 Ripple Cloud

# 1: ssid
# 2: encryption
# 3: key
connect_wifi() {
  ifaceid=0
  # disable existing wifi interfaces
  while :; do
    uci get wireless.@wifi-iface[$ifaceid] > /dev/null 2>&1
    if [ $? = 0 ]; then
      uci set wireless.@wifi-iface[$ifaceid].disabled=1
      ifaceid=$(($ifaceid + 1))
    else
      break
    fi
  done

  # add the new wifi-iface
  uci add wireless wifi-iface
  uci set wireless.@wifi-iface[-1].device=radio0
  uci set wireless.@wifi-iface[-1].network=wan
  uci set wireless.@wifi-iface[-1].mode=sta
  uci set wireless.@wifi-iface[-1].ssid=$1
  uci set wireless.@wifi-iface[-1].encryption=$2
  uci set wireless.@wifi-iface[-1].key=$3

  # remove eth0 interface from wan
  uci delete network.wan.ifname

  # commit changes
  uci commit

  # reload network
  ubus call network reload
  /sbin/wifi down
  /sbin/wifi up
}


