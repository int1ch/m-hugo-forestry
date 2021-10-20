+++
author = "Mk"
date = 2020-08-02T21:00:00Z
hero = ""
title = "Nginx Proxy Pass"
type = "blog"
tags = ["nginx"]

+++
proxy_pass http://back;  
proxy_set_header Host      $host;

    proxy_set_header

в данном случае обязателен для хоста так как иначе host = back