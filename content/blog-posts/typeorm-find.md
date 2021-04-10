+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "typeorm find"
type = "blog"

+++
Как сделать поиск по связанным объектам?

      //loadedTCatalog: Entity[];
      const loadedTPrice = await priceRepository.find({
        where: {
          agentLogin: agent.login,
          supplierId: new ObjectId(supplier._id).toHexString(),
          catalogItem: In(loadedTCatalog),
        },
      });	

НЕТ

не смотря на то что мы указываем catalogItem в фильтре, внутрь in попадает обьект целиком поэтому  рабочая конструкция будет либо: 

    catalogItem: loadedTCatalog[0], //NOT ARRAY!

либо: 

    catalogItem: In(loadedTCatalog.map((el) => el.id)),