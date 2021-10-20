+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "Nuxt.js + Typescript for serverside"
type = "blog"
tags = ["typescript", "vue.js", "nuxt.js" ]

+++

изначально была идея найти что то такое что одинаково хорошо подходило для написания кода на клиенте и на сервере и что бы раздачей кода занимался один node сервер

nuxt.js не подходит, в связке с ts он дает не понятные непредсказуемые ошибки

вроде как наследует express но нет, на пример не парсит Request.query

code релоад может заствалять все прегружать а пресборка пустого проекта - 20-30 секунд

для напомнаинния: при работе с моделями mongoosedb для code reload их надо создавать только первый раз

    export let Category: mongoose.Model<CategoryDocument>;
    try {
      Category = <mongoose.Model<CategoryDocument>>mongoose.model("Category");
    } catch (error) {
      Category = mongoose.model<CategoryDocument>("Category", CategorySchema);
    }
