+++
author = "Mk"
date = 2021-09-28T21:00:00Z
hero = ""
title = "Typescript: generaly typed get and set"
type = "blog"
tags = ["typescript", "typescript-generics"]

+++

Судя по всему, Многим очень хочеться получить от typescript какой то магический объект в который можно было бы запихивать все что угодно и получать то же и с типом. и все это в зависимости от ключа

```ts
    container.get("age"): number
    container.get("name"): string
    container.get("auth"): {....}
```

И вот я встретил подход который позволяет реализовать что то задуманое [https://saul-mirone.github.io/how-to-design-a-type-friendly-context/](https://saul-mirone.github.io/how-to-design-a-type-friendly-context/ "https://saul-mirone.github.io/how-to-design-a-type-friendly-context/")

который можно упростить до модели

```ts
    x.get(dataId<T>): T
    x.set(dataId<T>, T)
```

где dataId хранить в себе идентификатор и тип объекта в виде значений по умолчанию

Немного переписанный код выглядит вот так

```ts
//type Context = Map<symbol,Atom>

type Atom<T = unknown> = {
    id: symbol;
    value: T
    //default value is important for typed Container: store type as value<type>
}

class Context {
    protected m: Map
    ...
}
```

[Playground Link](https://www.typescriptlang.org/play?jsx=0#code/PTAuE8AcFMAIGED2A7U0AepYF5YFkBDSAHgGdwBbAI0QBsAaAQVEQoD4AoDiGWZ14gBUcsAK7IA1skQB3ZGxEBvDrFgBLACYAuWOWp0A3CtgA3ArVHQdwkBugAzAqNpYzFuGtLqKkRACdQAlRYe39YHmgNBBRAtWRoPx1SFj84CNgCLzdLYgjOAF8uAGNaTK8kVAwsZVVIP0Q0IrQoih1CEj0aBj4WdmMilGS-USb-AAoAShrVcIALTwA6ChF4mXwiI1VC2tEqWjUi9WQAK2gmoTYxgh1+Cgv6U3NLAH5rCZ0TRE1YadUB5GS6iiuAIC00mxm2TgAB9oSCFlCIapQPNSEsFqRoKAxpoHr8ZrjjDNHu56ETYPkJsZtrA6g0zs1YABzLEAZX2RWgFyuN16F3ePQEgjY+P+gIIvREKMWFAWLOxoM0E1gSPU9jGAEIJawpuTkbN6mtVrAAKJ+ep+MYAIlusGkWDipyakStE1VNNUqVAoj8yAyksygruwohNMguw5zKx3OuQf51h+5LFWG1y1w0rR8vZB2gVzd5K9Pr9qYRT2g1OM4b2B100eFPLjwoeULeosGKcl6dRcrZHNzBHzxJLUJEiIrhQ49nETTUKDt0BktyEInEUlk8jGEQAamXW-12+osLhWZQumMAOSp8+D2CF30-TQ6NSgZu78JQaA79z5DJeJfCrgJ2TDIAEYVgXW5rQADQAWgGOxXSMYCCAAJnAxdejGRRMVIUhZ2QHQQMpDhkIAZnQyDFHQQjiOApp0DA3BjQqNBMEmJCD3otCmIXaJKjY-MSNABiwROBkrhAql6JA0SnQVFCpOElDZPE1DFJEx1VNIvFqJQ2ilJUporlIqkhJEzEFRAh4rVmaBaFoRBEJIg8cLwudcGknt5PzVz8IxaBcPwkQUI4gE6GgBYHKZa1fLnOJYBQq0Hi4ryrgU-zApQfNgJMUjGNgTz5WM7KD1y7iCoMoqCBMgxYGcsLaAiqLrWqpLTDy5tSIUowuF6oA)

Дальнейшее усовершенствование и упрощение этой идеи можно найти в [Provide/Inject of vue]() С [примером использование vuex](https://next.vuex.vuejs.org/guide/typescript-support.html)
