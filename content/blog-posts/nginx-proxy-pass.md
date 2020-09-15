+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "Nginx Proxy Pass"
type = "blog"

+++
proxy_pass http://back;  
proxy_set_header Host      $host;

    proxy_set_header

в данном случае обязателен для хоста так как иначе host = back