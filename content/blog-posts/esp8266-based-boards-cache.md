+++
author = "Mk"
date = 2019-12-18T21:00:00Z
hero = ""
title = "ESP8266 based boards cache"
type = "blog"
tags = ['home', 'esp8266']

+++

### NodeMCU v3

![](/images/esp_layout.png)

### RobotDyn Webmos WiFi D1 mini

![](/images/wemos-d1-mini-pinout.jpg)

Flash mode : D3 -> GND

Analog: A0 может измерять напряжение питания на 3V3 (ESP.getVcc() )

Запрещенные пины Webmos при загрузке?

D1(05) + HIGH = вырубает монитор

D8 + HIGH = преключает в режим? Connecting to Host

D3 + LOW = Flash mod

D4(02) + LOW = ? Ломает монитор
