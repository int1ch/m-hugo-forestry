+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "VPN"
type = "blog"

+++
OpenVPN server на базе ubuntu 16.04

[https://www.digitalocean.com/community/tutorials/openvpn-ubuntu-16-04-ru](https://www.digitalocean.com/community/tutorials/openvpn-ubuntu-16-04-ru "https://www.digitalocean.com/community/tutorials/openvpn-ubuntu-16-04-ru")

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