+++
author = ""
date = ""
draft = true
hero = ""
title = "golang map "
type = "blog"
tags = ["golang"]

+++

dictionary := make(map\[string\]interface())

    m := make(map[string]int64)
    m["1"] = 2
    _, ok1 := m["1"]
    v, ok3 := m["3"]
    fmt.Println("Hello, playground", m["1"], ok1, v, ok3)
