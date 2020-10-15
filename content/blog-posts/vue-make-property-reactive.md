+++
author = "Mk"
date = 2020-10-10T21:00:00Z
hero = ""
title = "Vue make property reactive"
type = "blog"

+++
Вводная статья [на русском]() [на английском](https://vuejs.org/v2/guide/reactivity.html)

итак vue делает реактивным (навешивает геттеры сеттеры) на все что он видит в момент старта объекта

если b новый ключ то

vm.b = 2 // \`vm.b\` is NOT reactive

аналогично

    vm = new Vue({
      data: {
        a: { b: 1, c: 2 }
      }
    })
    vm.a.new = {} // new is NOT REACTIVE
    vm.a.arr = [] // is not reactive

правильно

    Vue.set(vm, 'b', 2)
    Vue.set(vm.a, 'new', {}) - внутренние свойства кстати не будут реактивным при добавлении
    Vue.set(vm.b, 'arr' []) - содержимое будет частично реактивно?

для массива не работает  
vm.items\[indexOfItem\] = newValue  
vm.items.length = newLength

все остальные операции

.push .slice .splice работатют и информируют родителя об изменениях (//TESTME)

для замены:

Vue.set(vm.b.arr, 1, 'new one')