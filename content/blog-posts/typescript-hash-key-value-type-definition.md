+++
author = "Mk"
date = ""
hero = ""
title = "Typescript hash(key/value) type definition"
type = "blog"

+++
    interface Hash {
      [key: string]: string 
    }

все очень просто \[string\]: string, но так как hash это key value  то key нам надо как то обозвать, вот и получается \[name: string\]: string

но на самом деле нам надо 

    type Hash = Record<string,string>