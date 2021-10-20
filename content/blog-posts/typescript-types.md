+++
author = ""
date = ""
draft = true
hero = ""
title = "Typescript types"
type = "blog"
tags = ["typescript"]

+++

    "string" instanseof String === false
    typeof "" === "string"

    new Error() instanceof Error === true
    typeof new Error() === "object"

    typeof([]) === "object"
    Array.isArray([]) === true
