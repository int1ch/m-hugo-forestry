+++
author = "Mk"
date = 2020-10-11T21:00:00Z
hero = ""
title = "Vue Child to Parent communication"
type = "blog"

+++
для начала можно взять рабочий пример который работает  на Javascript [https://vegibit.com/vuejs-parent-child-communication/](https://vegibit.com/vuejs-parent-child-communication/ "https://vegibit.com/vuejs-parent-child-communication/")

и документацию [на английском](https://vuejs.org/v2/guide/components.html#Listening-to-Child-Components-Events)  или [на русском](https://ru.vuejs.org/v2/guide/components.html#Прослушивание-событий-из-дочерних-компонентов-в-родительских-компонентах)

а теперь перенесем обработчик на уровень выше в рамках DOM

    <div class="card-body" @finished="finished"> 
    ...
    	<child-card :parentmessage="parentmessage"></child-card>

и все перестает работать

Утверждение: в отличии от браузерных событий, пользовательские vue события **не всплывают** вверх по дереву, и работают только обработчик при описании компоненты

    <child v-on:child-event="processEvent" ... >

Если надо передать событие наверх то проще передать обработчик вниз

[https://vuejs.org/v2/guide/components-custom-events.html#Binding-Native-Events-to-Components](https://vuejs.org/v2/guide/components-custom-events.html#Binding-Native-Events-to-Components "https://vuejs.org/v2/guide/components-custom-events.html#Binding-Native-Events-to-Components")

v-on="$listeners" где this.$listeners - это обработчики родителя