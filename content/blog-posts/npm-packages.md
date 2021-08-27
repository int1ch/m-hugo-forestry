+++
author = ""
date = ""
hero = ""
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

expressjs

nestJs = модный модульный фрэймворк (пока кажется очень не стабильным, например ошибки компиляции зависимостей, дезинформируют)

# SQL

knex = query builder with sql schema deployer

* [knex-stringcase](https://github.com/Kequc/knex-stringcase) = помощь в преобразований

typeorm = sql orm working, из недостатков,

* медленный старт, компиляция схем - 3-4 секунды всегда,
* при автоматическом создании название полей и столбцов postgress не совместимы, - требуют использование

microorm = sql orm, документация непонятнее чем typeorm

# TESTING

[rewire](https://github.com/jhnns/rewire) - mock non public functions

testing frameworks в целом очень плохожи,

* jest + jest-ts
* mocha

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