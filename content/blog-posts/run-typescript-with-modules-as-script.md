+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "Run typescript with modules as script"
type = "blog"

+++
npx ts-node -s ./scripts/config-read.ts

Cannot use import statement outside a module

проблема проста если есть проект на TypeScript то наверно надо как то уметь запускать более маленькие скипты которые могут использовать весь код

cat scripts/module.ts

    function hello_module(){
    	console.log("hello from module");
    }
    export default hello_module;

npx ts-node

    import hello from "./scripts/module";
    ^^^^^^
    Uncaught SyntaxError: Cannot use import statement outside a module

что бы заставить модули работать нужно включить опцию module: "CommonJS"  
и ts-node (на 9.0.0 это уже работает)

([https://github.com/TypeStrong/ts-node#import-statements](https://github.com/TypeStrong/ts-node#import-statements "https://github.com/TypeStrong/ts-node#import-statements"))

Опция tsconfig: paths

если хочеться по какой то причине эту опцию использовать то все же стоит

ожидаеться что опция задаеться так

    {
    	"compilerOptions": {
        	"baseUrl": ".",
            "paths": {
          		"~/*": ["./*"],
        	},
        }
    }

но можно поверить как же оно транспиляеться с помощью npx tsc --showConfig

     npx tsc --showConfig ./scripts/use-import-module.ts
    {
        "compilerOptions": {},
        "files": [
            "./scripts/use-import-module.ts"
        ]
    }

кроме этого есть инфрмация что paths не поддерживаеться в ts-node  
но для этого есть обходной модуль [https://github.com/dividab/tsconfig-paths](https://github.com/dividab/tsconfig-paths "https://github.com/dividab/tsconfig-paths")

(не проверен)