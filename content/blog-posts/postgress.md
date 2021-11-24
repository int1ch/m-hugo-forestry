+++
author = "Mk"
date = 2021-03-07T21:00:00Z
draft = true
hero = ""
tags = ["db", "postgres"]
title = "postgress"
type = "blog"

+++
users in postgress

[https://www.dmosk.ru/miniinstruktions.php?mini=postgresql-users](https://www.dmosk.ru/miniinstruktions.php?mini=postgresql-users "https://www.dmosk.ru/miniinstruktions.php?mini=postgresql-users")

    sudo su - postgres
    psql -Upostgres
    CREATE USER tx WITH PASSWORD 'xxx';
    create database tx_2 with owner='tx'
    GRANT ALL PRIVILEGES ON DATABASE "tx_2" to tx;
    -- выполнять надо из базы
    \connect tx_prod
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "tx";
    GRANT SELECT, UPDATE, INSERT, DELETE  ON ALL TABLES IN SCHEMA "public" to tx_prod;
    GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public to tx_prod;
    ^C
    sudo vim /etc/postgresql/13/main/pg_hba.conf
    #host    tx_2            tx              0.0.0.0/0               md5
    ## md5 довольно чувствителен
    :q
    
    sudo systemctl restart postgresql
    sudo systemctl status postgresql

не сработает

    create database tx_2 with owner='tx' encoding='utf-8' LC_COLLATE="ru_RU.UTF-8" LC_CTYPE='ru_RU.UTF-8';
    # ^^^ можеть конфликтить с шаблоном из которого все создаеться