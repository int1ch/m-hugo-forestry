+++
author = "Mk"
date = 2020-07-31T21:00:00Z
hero = ""
title = "Raspbery pi as a router"
type = "blog"

+++
для того что бы раздавать интернет удобно воспользоваться [https://raspap.com/](https://raspap.com/ "https://raspap.com/") который поднимаеться на 80 порту

в целом он все делает нормально, НО только в конфигурации которая задумана авторами, переконфигурация убивает ручные изменения в конфигах

НО:  
если название сетевого интерфейса eth0 то лучше его так и оставить, и не переключать через raspi-config: Enable predictable interface names

сделать его непонятным можно, обратно вернуть сложно.

что может захотеться поменять: адреса адаптеров

vim /etc/dhcpcd.conf

НО: vim  /etc/network/interfaces.d/ не работает

настройки dhcp

за это отвечает [dnsmasqurade](http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html)

sudo systemctl status dnsmasq.service  
ps aux | grep dnsmasq  
dnsmasq -7 /etc/dnsmasq.d --test

НО:  RaspAP оставляет конфиги в /etc/dnsmasq.conf, в отдельной дириктории удобнее

НО конфиг для dhcp для двух сетей

cat /etc/dnsmasq.d/dhcp_options

    interface=eth0
    dhcp-range=interface:eth0,192.168.91.10,192.168.91.200,255.255.255.0,1h
    dhcp-option=interface:eth0,3,192.168.91.1
    dhcp-option=1,255.255.255.0
    #ROUTER
    dhcp-option=interface:eth0,option:dns-server,192.168.91.1
    dhcp-option=option:domain-name,home
    
    interface=wlan0
    dhcp-range=interface:wlan0,192.168.90.10,192.168.90.200,255.255.255.0,1h
    dhcp-option=1,255.255.255.0
    #ROUTER
    dhcp-option=interface:wlan0,3,192.168.90.1
    #
    dhcp-option=interface:wlan0,option:dns-server,192.168.90.1
    dhcp-option=option:domain-name,home

настройки роутинга и masquerade

Raspberi Pi + Dongle + eth0

при наличии двух eth1 + eth0 все немного усложняется по умолчанию неизвестный трафик идет через сеть с минимальной метрикой

route -n

    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    0.0.0.0         192.168.91.1    0.0.0.0         UG    202    0        0 eth0
    0.0.0.0         192.168.8.1     0.0.0.0         UG    204    0        0 eth1
    0.0.0.0         192.168.90.1    0.0.0.0         UG    303    0        0 wlan0
    192.168.8.0     0.0.0.0         255.255.255.0   U     204    0        0 eth1
    192.168.90.0    0.0.0.0         255.255.255.0   U     303    0        0 wlan0
    192.168.91.0    0.0.0.0         255.255.255.0   U     202    0        0 eth0

те интернет на свистке работать не будет

sudo vim /etc/dhcpcd.conf

    interface eth1
    metric 200

sudo /etc/init.d/dhcpcd restart

Routing

предпологая что nft уже устновлен можно воспользоваеться [инструкцией](https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT))

    nft list ruleset -a
    nft add table nat
    nft 'add chain nat postrouting { type nat hook postrouting priority 100 ; }'
    nft add rule nat postrouting ip saddr 192.168.91.0/24 ip daddr != 192.168.91.0/24 masquerade