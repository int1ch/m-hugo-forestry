+++
author = ""
date = ""
draft = true
hero = ""
title = "npm packages"
type = "blog"

+++
LOGS

loggers:

* pino = far fast json logs
* winston = for slowly write logs, may be pino is better?
* console.log = default

external log srvices:

* [Sentry](https://sentry.io/pricing/) = ?
* [Elastic search + kibana](https://www.elastic.co/downloads/) = !
* [logFlare](https://logflare.app/pricing#backend)
* [logDNA](https://www.logdna.com/)

error stack trace

[longjohn](https://github.com/mattinsler/longjohn) = longer and better stack trace ([reference long-stack-traces]())

[v8 stack trace api ](https://v8.dev/docs/stack-trace-api)

[fastify](https://www.fastify.io/ecosystem/) = lighten (then express) http server framework with tested [ecosystem](https://www.fastify.io/ecosystem/)

fastify-auth = конвейеры для реализации авторизации, авторизации не включены

SQL

knex = query builder with sql schema deployer

typeorm = sql orm working

microorm = sql orm, i got problems with understanding documentation

TESTING

[rewire](https://github.com/jhnns/rewire) - mock non public functions

frameworks (similr)

* jest + jest-ts
* mocha

Other

tarn = resorce pool (knex dpendend on it)

axios = fetcher

[grant](https://github.com/simov/grant) = working oauth authorizer ()