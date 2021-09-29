+++
author = "Mk"
date = 2021-09-28T21:00:00Z
draft = true
hero = ""
title = "Typescript typed get set"
type = "blog"

+++
Судя  по всему очень хочеться от typescript получить какой то магический объект в который можно было бы запихивать все что  угодно и получать то же. и все это в зависимости от ключа

container.get("age") => number

container.get("name") => string

container.get("auth") => {....}

И вот я встретил похожий подход [https://saul-mirone.github.io/how-to-design-a-type-friendly-context/](https://saul-mirone.github.io/how-to-design-a-type-friendly-context/ "https://saul-mirone.github.io/how-to-design-a-type-friendly-context/")

который можно упростить до модели

x.get(dataId<T>): T

x.set(dataId<T>, T)

где dataId хранить в себе идентификатор и тип объекта в виде значений по умолчанию

Немного преписанный код выглядить вот так