+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "Nuxt.js + axios cookbook"
type = "blog"

+++
типа официальная документация [https://axios.nuxtjs.org/](https://axios.nuxtjs.org/ "https://axios.nuxtjs.org/") но она гавно если у вас старая версия Nuxt

axios на nuxt v2.10 совершенно не хотел делать запросы на сторонний api сервер v2.14.7 уже норм

я строю изощеренный вариант когда backend на typescript хоть и лежит в тех же папках но стоит в сторонке и запускаеться через tsc -w + nodemon = потому что сервер чаще требует перегрузки всего (изменилась схема) и терять по 1-2минуты на пересборку верстки nuxt это слижком много

## adding to nuxt

## configuration

базовая конфигруация?

cat nuxt.config.js

    export default {
      axios: {
      	host: "localhost",
        prefix: "/api/",
        port: "3000"
      },
    }

    export default {
      axios: {
      	baseURL: "http://localhost:3000/api/"
      },
    }

Данные конфигурации идентичны причем при задании baseURL верхнее не имеет смысла

Моя конфигурация на 8081 - работает nuxt, на 8082 express который умеет api, поэтому серверная часть nuxt ходить в 82 напрямую, на браузерная в 81 через прокси - что бы передавать cookies

    export default {
      ....
      publicRuntimeConfig: {
        axios: {
          browserBaseURL: 'http://localhost:8081/api',
        },
      },
      privateRuntimeConfig: {
        axios: {
          baseURL: 'http://localhost:8082/api',
        },
      },
      proxy: {
        '/api/': { target: 'http://localhost:8082' },
      },

## logging

Штатный debug не дает никакой полезной инфрмации кроме того что "Шэф усе пропало" поэтому его можно отключить вместо него можно использовать plugin

cat nuxt.config.js

    export default {
      axios: {
      	debug: false,
      },
      plugins: [
        '~/plugins/axios'
      ]
    }

cat \~/plugins/axios

    export default function({ $axios, redirect }) {
      $axios.onRequest(config => {
        console.log(config);
        console.log('AXIOS request to ' + config.baseURL + config.url);
      });
    
      $axios.onError(error => {
        console.log(
          'Axious Error:',
          error.request.method,
          error.request.host,
          error,
        );
        console.log('Axious config', error.config);
        console.log('Axious request', error.request);
        console.log('Axious response', error.response);
      });
    }

документация [https://axios.nuxtjs.org/extend](https://axios.nuxtjs.org/extend "https://axios.nuxtjs.org/extend")

error который приходит в onError это [https://github.com/axios/axios/blob/master/lib/core/enhanceError.js](https://github.com/axios/axios/blob/master/lib/core/enhanceError.js "https://github.com/axios/axios/blob/master/lib/core/enhanceError.js")

    enhanceError(new Error(...))