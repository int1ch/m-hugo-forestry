+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "typeorm toStr"
type = "blog"

+++
в mongoose есть прекрасный ObjectId и захолось мне его сохранить что бы взяаьб две базы, но проблема что обычно _id имеет type: any

поэтому при 

    tPrice = priceRepository.create({
            catalogItem: tCatalog,
            agentLogin: agent.login,
            supplierId: supplier._id, // ObjectId as any
            price: item.price,
            qMin: item.qMin,
            priceSet: item.priceSet,
          });

происходит фигня и в базу запишется '"xxxxx"' вот да в кавычках