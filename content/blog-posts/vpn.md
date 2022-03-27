+++
author = "Mk"
date = 2020-08-01T21:00:00Z
hero = ""
tags = []
title = "VPN"
type = "blog"

+++
OpenVPN server на базе ubuntu 16.04

[https://www.digitalocean.com/community/tutorials/openvpn-ubuntu-16-04-ru](https://www.digitalocean.com/community/tutorials/openvpn-ubuntu-16-04-ru)

за одним НО так как я разворачиваюсь на OpenVZ виртуалке, то tun как фича ядра включаеться в контрольной панели хостера "Enable tun/..."

для debian инструкция не актуальна

OpenVpn as service

OpenVpn поставляется с генераторами сервисов.

поэтому для серверного конфига

    /etc/openvpn/server.conf

работает

    sudo systemctl status openvpn@server

а для клиентского

    ls /etc/openvpn/client/client.conf
    
    sudo systemctl  status openvpn-client@client



convert to a router:

* eth1 => modem dongle
* eth0 => LAN
* wlan0 => wifi LAN

```
sudo vim /etc/dhcpcd.conf
# add
interface eth1
metric 200 #to select eth1(dongle) for unknown traffic

interface eth0
metric 205
```

```
    sudo apt-get install iptables 
    # NAT
    sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
    # FORWARD eth0 => eth1
    sudo iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
    sudo iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
    # FORWARD wlan => eth1 
    sudo iptables -A FORWARD -i wlan0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
    sudo iptables -A FORWARD -i eth1 -o wlan0 -j ACCEPT

	# SAVE routes
    sudo apt-get install iptables-persistentcat /etc/iptables/rules.v4
```

