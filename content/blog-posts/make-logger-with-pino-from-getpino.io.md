+++
author = ""
date = ""
draft = true
hero = ""
tags = []
title = "make logger with pino from getPino.io"
type = "blog"

+++
## Serializers

[https://getpino.io/#/docs/api?id=serializers-object](https://getpino.io/#/docs/api?id=serializers-object "https://getpino.io/#/docs/api?id=serializers-object")

по умолчанию pino умеет дампить нестандартные объекты только для поля err считая что там Error

причина исключительности:

    JSON.stringify(new Error) === '{}'

впрочем для дампа обычных объектов иногда надо заморачиваться

при дампе request / response в любом стандартном фрэймворке получиться черезмерная простыня 

[https://github.com/pinojs/pino-std-serializers](https://github.com/pinojs/pino-std-serializers "https://github.com/pinojs/pino-std-serializers")

так что 

    import pino from "pino";
    const logger = pino({
      serializers: {
        err: pino.stdSerializers.err,
        error: pino.stdSerializers.err,
        req: pino.stdSerializers.req,
        res: pino.stdSerializers.res,
      },
    });