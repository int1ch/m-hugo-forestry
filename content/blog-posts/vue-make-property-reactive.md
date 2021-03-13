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

    import Vue from 'vue';
    vm = new Vue({
      data: {
        a: { b: 1, c: 2 }
      }
    });
    vm.a.new = {}; // a.new is NOT REACTIVE
    vm.a.arr = []; // a.arr not reactive

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

или что бы не подключать vue можно воспользоваться this.$set

this.$set(this.someObject, 'b', 2)

Note: если приходится выставлять много свойст то возможно вы что то делаете неправильно, возможно стоит выставлять один жирный и вычислеслять / вычленять всего что нужно в computed секции 