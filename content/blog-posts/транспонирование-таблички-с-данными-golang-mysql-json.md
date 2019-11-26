+++
author = ""
date = ""
draft = true
hero = ""
title = "Транспонирование таблички с данными (golang mysql json)"
type = "blog"

+++
Задача 

нарисовать временной график значения 

возможное отображения данных для отрисовки

* несколько рядов данных { t: \[ {ts:  value:..}, {ts:..., value:...} \]}
* комбинированные ряды \[{date: ..., value1: ..., value2:...}, date:..., value1:... value3:...\]

возможные способы хранения в mysql

* не типизированные
  * device: deviceID, ...
  * header: deviceID, _headerID, nameOfHeader,..._
  * reading: datetime, headerID, value,


* типизированные
  * device: deviceID, deviceType
  * readingsOfTypeXXX: datetime, value1, value2 ....