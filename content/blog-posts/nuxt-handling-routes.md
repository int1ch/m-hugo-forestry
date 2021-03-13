+++
author = "Mk"
date = 2021-03-12T21:00:00Z
hero = ""
title = "Nuxt handling * routes"
type = "blog"

+++
Обработка произвольных запросов.

описние простых случаев xxx/:id можно найти  в документации [https://nuxtjs.org/docs/2.x/directory-structure/pages#dynamic-pages](https://nuxtjs.org/docs/2.x/directory-structure/pages#dynamic-pages "https://nuxtjs.org/docs/2.x/directory-structure/pages#dynamic-pages")

но лучше пойти вот сюда [https://nuxtjs.org/docs/2.x/features/file-system-routing](https://nuxtjs.org/docs/2.x/features/file-system-routing "https://nuxtjs.org/docs/2.x/features/file-system-routing")

и там есть одно [неочевидное замечание](https://nuxtjs.org/docs/2.x/features/file-system-routing#dynamic-routes) 

xxx/_id.vue будет отвечать на запросы вида /xxx/(:id)?

yyy/_slug/index.vue требует обязательного наличия :slug 

Копаем глубже

zzz/_.vue означает перехват всех запросов /zzz/* например zzz/xxx/yyy?x=com#zzz

при этом доступ до свойств запроса возможен иp

this.$router.currentRoute

например:

this.$router.currentRoute.fullPath === "/zzz/xxx/yyy?x=com#zzz"

this.$router.currentRoute.fullPath === "/zzz/xxx/yyy?x=com" // на сервере

this.$router.currentRoute.query:  === { x: 'com' }

this.$router.currentRoute.params === { pathMatch: 'xxx/yyy' }

[документация](https://router.vuejs.org/ru/api/#свойства-объекта-route) currentRoute 