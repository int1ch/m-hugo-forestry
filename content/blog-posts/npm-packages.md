+++
author = ""
date = 2021-08-23T21:00:00Z
hero = ""
tags = ["node.js", "typescript"]
title = "npm packages"
type = "blog"

+++
# LOGS

[debug](https://www.npmjs.com/package/debug) = logger.error helper

### loggers

* pino = far fast json logs
* winston = for slowly write logs, may be pino is better?
* console.log = default

### external log services

* [Sentry](https://sentry.io/pricing/) = ?
* [Elastic search + kibana](https://www.elastic.co/downloads/) = !
* [logFlare](https://logflare.app/pricing#backend)
* [logDNA](https://www.logdna.com/)

### error stack trace

при использовании async / await стэк трейсы практически бесполезны, так как ошибки чаще возникают в сторонних модулях, а все что происходит после await редко соединено с основным стеком вызова

поэтому самое простое - перехват ошибки

[longjohn](https://github.com/mattinsler/longjohn) = longer and better stack trace ([reference long-stack-traces]())

node-stack-trace

[v8 stack trace api ](https://v8.dev/docs/stack-trace-api)

# http server framework

[fastify](https://www.fastify.io/ecosystem/) = lighten (then express) http server framework with tested [ecosystem](https://www.fastify.io/ecosystem/)

fastify-auth = конвейеры для реализации авторизации, авторизации не включены

[fastify-openapi-glue](https://github.com/seriousme/fastify-openapi-glue/tree/master/lib) = Swagger Open Api schema validation.

expressjs

nestJs = модный модульный фрэймворк (пока кажется очень не стабильным, например ошибки компиляции зависимостей, дезинформируют)

[blitz.js](https://blitzjs.com/docs/get-started) React full stack

https server (static)

* [https://parceljs.org/](https://parceljs.org/ "https://parceljs.org/") - http server with no configuration
* [http-server](https://github.com/http-party/http-server) - static http server

hapi [https://hapi.dev/](https://hapi.dev/plugins "https://hapi.dev/plugins") Сервер, для формирования api? похоже что не справился с ростом: в районе 17-18 версии они сделали перименование hapi => @hapi/hapi которое понятнуло переименование под модулей не все из которых перехали: пример: hapi-swaggered -> c форком [https://github.com/danh20051995/hapi-swagger](https://github.com/danh20051995/hapi-swagger "https://github.com/danh20051995/hapi-swagger")  
однако форк не отражен в документации.

# SQL

knex = query builder with sql schema deployer

* [knex-stringcase](https://github.com/Kequc/knex-stringcase) = помощь в преобразований
* [cheatsheet](https://devhints.io/knex)

typeorm = sql orm working, из недостатков,

* медленный старт, компиляция схем - 3-4 секунды всегда,
* при автоматическом создании название полей и столбцов postgress не совместимы, - требуют использование

microorm = sql orm, документация непонятнее чем typeorm

# TESTING

[rewire](https://github.com/jhnns/rewire) - mock non public functions

[nock](https://github.com/nock/nock) - intercept node.js http reuquests (from axios too)

testing frameworks в целом очень плохожи,

* jest + jest-ts
* mocha
* [https://visionmedia.github.io/superagent/#request-basics](https://visionmedia.github.io/superagent/#request-basics "https://visionmedia.github.io/superagent/#request-basics") = для терирования под видом UA

# Other

tarn = resource pool (knex dpendend on it)

axios = fetcher

[grant](https://github.com/simov/grant) = working oauth2 authorizer ()

[joi](https://github.com/sideway/joi) = validation (need [investigation](https://dev.to/olufemi/validation-joi-brings-you-joy-fof))

dotenv

[rxJs](https://rxjs.dev/guide/) = ? complex library

[ramda](https://ramdajs.com/docs/) = ? complex library

[rimraf](https://github.com/isaacs/rimraf) = directory cleaner

[bull]() = redis based queue (production problems?)

[morgan]() = http access logs middlware

[uuid](https://www.npmjs.com/package/uuid) = uuid generator

typescript

ts-node =

ts-node/register

[bcryptjs](https://www.npmjs.com/package/bcryptjs) = for hashing passwords

## TEMPLATERS

[dustjs](http://www.dustjs.com/) = templater, простой шаблонизатор, с глобальными контекстом в шаблонах, и блокам, однако vue slots не достижимы (или не понятно как )

[vue+ssr](https://ssr.vuejs.org/) = templater НЕ рекомендуеться в качестве отдельно стоящего шаблонизатора, сложно конфигуривать webpack, не удалось добиться прямой передачи данных в new Vue({data:{}}) для bundleRenderer, возможно проще использовать готовые примеры с передачей данных через vuex

## FORM Validation

[vee-validate](https://vee-validate.logaretm.com/v3/guide/basics.html) = для vue + vuetify client-side, позволяет пачкой получать ошибки с сервера, и вставлять стандарые места v-input

[validate.js]() = для серверной валидации (совместим с vee-validate)

CODE Highlighter

* [https://highlightjs.org/](https://highlightjs.org/download/ "https://highlightjs.org/download/")
* CROMA - [https://github.com/alecthomas/chroma](https://github.com/alecthomas/chroma "https://github.com/alecthomas/chroma"), used in HUGO

## Docker

docker-sync - non npm, increase speed for macosx