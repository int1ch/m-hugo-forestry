+++
author = "mk"
contacts_city = "Moscow"
contacts_email = "mike@mellior.ru"
contacts_phone = "+79265573110"
contacts_show = true
date = 2021-12-20T21:00:00Z
developer_name = "Mike Nikitin"
developer_position = "Node.js Developer"
draft = true
hero = ""
stack = ["Docker", "Git", "Vue.js", "Postgres, MySQL", "Perl", "Typescript node.js"]
title = "LaserHub Eng Resume"

+++
## Profile

Most of the experience I've got in Yandex, making the backend for best high loaded :) user-customized portal page. I do not fully match your requirements: I didn't dig DNS protocol yes. But I know regexp (heavy Perl background). Had crawler/extractor project based on CSS selector search. Wrote Frontend (mostly for admin interfaces). Believe in Typescript - it makes code more predictable.

## Work experience

### **TradeXFactor startup**

October 2020 — June 2021

Full-stack development of MVP: We try to create a platform for sales managers to exchange price lists, and test business processes.

Stack: NuxtJs(vue.js), vuetify, typescript/node.js mongoDB

### **Yandex** — Senior Software Developer

February 2009 — December 2019

#### **Messenger project**

Stack: Python, Postgres, docker + yandex internal cloud

* build api to union different messenger like services
* interview new developers

#### **OTRS** (Fork of OpenSource Ticket Request System)

Build system for ticket filtering/routing, based on V8 and client written rules on javascript language

#### **Main Yandex portal page** ([http://yandex.ru](http://yandex.ru "http://yandex.ru"))

Stack: perl node.js mysql memcached

Developing, Maintaining, and evolving serverside for main Yandex portal page.

* developing new features in connection with frontend and data providers
* supporting old features, investigating bugs or unpredictable behavior
* interviewing new developers, boot camping, code review.

#### **Authorization system**

multi domain authorization cookie synchronization, know how to set cookies :)

## Education

The Moscow Institute of Physics and Technology (MIPT): Magistr of applied mathematics and physics (2006)

## Bug Report

I reviewed Russian shops provided by _glopal.ru_. You made great work with translation but it's not accurate. In the case of Russian language you are close to aliexpress level :(

I assume that Russian localization is not in priority for many brands. But you put some sites in your portfolio, and it shows that you have no quality control as a process.

### Translation

worst eye leaking translation

[https://ru.jbtools.com/](https://ru.jbtools.com/ "https://ru.jbtools.com/") - _Global shipping_ and _60-days Return_ - a red, big captions translated  with incorrect endings

"Глобальн**ый** перевозк**и**" can be corrected to "Глобальные перевозки"  but  is better to use here "International shipping" = "Международная доставка",

"60-дневн**ый** Возвращен**ие"** should be replaced with "60-дневный Возврат"

It seems you use an automatic translation for phrases in html tags, but human translators/checkers should be used here to see the context and ensure that translation is correct and readable.

Have you considered hybrid translating systems? or systems with translation memory? Where humans can correct machine translation?

### Fonts

you don't modify fonts. So when original site uses font without Cyrillic. Browser use fallback to default serief font and page become ugly because of usage serif / non-serifs fonts in one text.

example:

 [https://ru-olpro.glopalstore.com/delivery/](https://ru-olpro.glopalstore.com/delivery/?utm_campaign=oth_r&utm_source=https://olproshop.com&utm_medium=wi_proxy&utm_content=en_GB&utm_term=a "https://ru-olpro.glopalstore.com/delivery/?utm_campaign=oth_r&utm_source=https://olproshop.com&utm_medium=wi_proxy&utm_content=en_GB&utm_term=a")

### Delivery pages

As for me, the delivery page is one of the most important pages, where I could know if delivery is worldwide, almost all delivery pages I've checked have information about UK, which is nonrelevant for me.

* [https://ru-chainspeed.glopalstore.com/delivery/](https://ru-chainspeed.glopalstore.com/delivery/ "https://ru-chainspeed.glopalstore.com/delivery/")
* [https://ru.watcho.co.uk/info/delivery.html](https://ru.watcho.co.uk/info/delivery.html "https://ru.watcho.co.uk/info/delivery.html")
* [https://ru.jbtools.com/shipping-returns/#international](https://ru.jbtools.com/shipping-returns/#international "https://ru.jbtools.com/shipping-returns/#international") - actually i couldn't  make it deliver to Russia :(

so maybe Glopal should rewrite delivery pages, at least remove information witch is not connected with localization region.

### Redirectes

I found several sites witch have redirect to global version witch redirect to local version and then again. for example:

* [https://ru.watcho.co.uk/watches/seiko.html](https://ru.watcho.co.uk/watches/seiko.html "https://ru.watcho.co.uk/watches/seiko.html") 

### Broken links

* [https://ru-chainspeed.glopalstore.com/brands/SW%252dMOTECH.html](https://ru-chainspeed.glopalstore.com/brands/SW%252dMOTECH.html "https://ru-chainspeed.glopalstore.com/brands/SW%252dMOTECH.html") - just broken
* ru.nordiclife.co.uk => no css: 404 by [https://cdn.shopify.com/s/files/1/0685/8849/t/24/assets/bold-upsell-custom.css?1487](https://cdn.shopify.com/s/files/1/0685/8849/t/24/assets/bold-upsell-custom.css?1487 "https://cdn.shopify.com/s/files/1/0685/8849/t/24/assets/bold-upsell-custom.css?1487")

So that's just the brief review. and I hope you are not expecting such problems in other localizations.