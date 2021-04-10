+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "typeorm"
type = "blog"

+++
typeorm hidden fields

Проблема: typeorm при каждой синхронизации удалял все столбцы таблицы и создавал их заново включая поля которые не были описаны в Entity

Решение: удалить ранее собранные js файлы

  

из-за особенностей запуска проект пришлось подключить orm не к ts файлам а к скомпилированными js

    module.exports = {
      type: 'postgres',
      //...
      synchronize: true,
      logging: true,
      entities: [
        //"server/models/orm/**/*.ts",
        'built/models/orm/**/*.js',
      ],
      migrations: ['server/migration/**/*.ts'],
      subscribers: ['server/subscriber/**/*.ts'],
    };

так же в собранной дириктори осталась личинка превичной модели (с полями lastName firstName isActive)

built/models/CatalogItem.orm.js

и новый файл  
built/models/orm/CatalogItem.js

в результате после запуска у typeorm сносило крышу - она удаляла все поля таблицы и создавала из заново

    [Node] query: SELECT * FROM "information_schema"."tables" WHERE "table_schema" = current_schema() AND "table_name" = 'typeorm_metadata'
    [Node] query: DROP INDEX "IDX_32bdb097aa6a7656ca737f0575"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "firstName"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "lastName"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "isActive"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "name"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "name_cleaned"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "brand"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "code"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "desc"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "desc_cleaned"
    [Node] query: ALTER TABLE "t_catalog_item" DROP COLUMN "category"
    [Node] query: ALTER TABLE "t_catalog_item" ADD "brand" character varying NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "code" character varying NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "desc" character varying NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "desc_cleaned" character varying
    [Node] query: ALTER TABLE "t_catalog_item" ADD "category" character varying
    [Node] query: ALTER TABLE "t_catalog_item" ADD "firstName" character varying NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "lastName" character varying NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "isActive" boolean NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "name" character varying NOT NULL
    [Node] query: ALTER TABLE "t_catalog_item" ADD "name_cleaned" character varying NOT NULL
    [Node] query: CREATE UNIQUE INDEX "IDX_32bdb097aa6a7656ca737f0575" ON "t_catalog_item" ("brand", "code")
    [Node] query: COMMIT

вывод: typeorm как то хитро идексирует модели