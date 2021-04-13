+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "typeorm + postgress fileds name"
type = "blog"

+++
какая нотация у typeScript ? camelCase

какая нотация у postgress = snake_case 

что будет если смешать их вместе? "camelCase" и обильное использование кавычек

    поэтому пример 
    createQueryBuilder("user")
        .where("user.firstName = :firstName", { firstName: "Timber" })
        .orWhere("user.lastName = :lastName", { lastName: "Saw" });

не корректен

ибо надо использовать 'user."firstName" = :firstName' или  '"someCase"."firstName"'