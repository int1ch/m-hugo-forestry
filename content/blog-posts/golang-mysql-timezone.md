+++
author = "Mk"
date = 2019-11-06T21:00:00Z
draft = true
hero = ""
title = "golang + mysql + timezone"
type = "blog"

+++
Можно сделать два подхода при работе с датой и временем

простой: игнорировать временную зону и хранить все как пойдет для этого в mysql есть тип datetime

а для драйвера mysql добавляется опция подключения parseDate

и все будет работать до тех пор пока не появяться временные зоны или поструюеться сделать операцию с unixtime (привет UTC)

Если временная зона нужна - 

alter table X modify Y timestamp()

и в строчке подключения добавляются 2 таймзоны парсер и mysql

    parseTime=True

    &loc=UTC

    &time_zone=%27UTC%27

loc для UTC можно опустить

[https://github.com/go-sql-driver/mysql#system-variables](https://github.com/go-sql-driver/mysql#system-variables "https://github.com/go-sql-driver/mysql#system-variables")

только предварительно знает ли база такую зону 

    SET time_zone = 'UTC';
    ERROR 1298 (HY000): Unknown or incorrect time zone: 'UTC'

mysql time zones:

[https://mariadb.com/kb/en/library/time-zones/](https://mariadb.com/kb/en/library/time-zones/ "https://mariadb.com/kb/en/library/time-zones/")

[https://mariadb.com/kb/en/library/mysql_tzinfo_to_sql/](https://mariadb.com/kb/en/library/mysql_tzinfo_to_sql/ "https://mariadb.com/kb/en/library/mysql_tzinfo_to_sql/")