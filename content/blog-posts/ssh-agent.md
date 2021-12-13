+++
author = ""
date = 2021-12-12T21:00:00Z
draft = true
hero = ""
tags = []
title = "Ssh agent"
type = "blog"

+++
[Статья на Habr RU](https://habr.com/ru/company/skillfactory/blog/503466/)  

    # run agent
        ssh-agent
        # add key
        ssh-add
        
        # bind agent to host
        vim ~/.ssh/config
        Host xxx
        	HostName xxx.xxx
            ForwardAgent yes
        :q
        
        # check key in list 
        ssh-add -l