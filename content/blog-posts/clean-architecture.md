+++
author = "Mk"
date = 2022-10-10T21:00:00Z
hero = ""
tags = []
title = "Clean Architecture"
type = "blog"

+++
В очердной раз словил приход под название Clean Arhitecture

что данный подход обещает/меняет: **Архитектура приложения  должна быть такой что бы его было легко тестировать!**

как предлагаеться реализовать: Логика приложения должна быть отвязана от фреймворков. Не надо тестировать фрэймворки - тестируйте приложение.

где почитать подробнее

* [https://habr.com/ru/company/mobileup/blog/335382/](https://habr.com/ru/company/mobileup/blog/335382/ "https://habr.com/ru/company/mobileup/blog/335382/")
* https://logicroom.co - **Pete Heard** продвигает свою UI академию на базе этих принципов - только речь идет про разработку spa/мобильных приложений. Ну видимо область применения особо не имеет значения
* [https://nanosoft.co.za/blog/post/clean-api](https://nanosoft.co.za/blog/post/clean-api "https://nanosoft.co.za/blog/post/clean-api")

Как применить на практике - можно ограничить зависимости например с помощью [https://github.com/sverweij/dependency-cruiser](https://github.com/sverweij/dependency-cruiser "https://github.com/sverweij/dependency-cruiser") 

    yarn add -D dependency-cruiser
    yarn depcruise --init

`vim .dependency-cruiser.js`

    /** @type {import('dependency-cruiser').IConfiguration} */
    module.exports = {
      forbidden: [
        /* clean architecture restricion  */
        {
          name: "no-dependency-from-domain",
          severity: "error",
          comment: "Try to close dependency inside domain directory",
          from: {
            path: "^src/domain",
          },
          to: {
            pathNot: "^(src/domain/|node_modules/)",
          },
        },

теперь src/domain может использовать только внутренние зависимости

если что-то нужно извне (из базы/внешенего источника) необходимое описываем в интефрейсее и поставляем через dependency injection

вот тут есть развернутый пример [https://nanosoft.co.za/blog/post/clean-api](https://nanosoft.co.za/blog/post/clean-api "https://nanosoft.co.za/blog/post/clean-api")

Сложности

* дублирование кода, реализация внешней зависимости заставляет сначала писать интрефейс а потом тоже самое в реализации. возможно можно внешние иточники подключить напрямую. без интерфейсов - но тут нужен баланс и практика которой пока мало
* адаптеры для фреймворков, при работе с http сначала надо достать из запроса всю необходимую информацию, затем адаптировать ответ и все положить обратно. (адаптеры должны быть простыми)