+++
author = "Mk"
date = 2022-06-01T21:00:00Z
draft = true
hero = ""
tags = []
title = "Typescript + webpack + ... chunks + sentry"
type = "blog"

+++
It was pretty tricky to merge subject items all toghether but finally it works.

webpack can work with ts and that the banlde of packages we user

* typescript
* mocha
  * ts-node as a loader
* webpack
  * ts-loader
* sentry

typescript + webpack

it's pretty simple, you can find configuration using ts-loader

     { "compilerOptions": {
        "module": "commonjs",
        "target": "es6",
        "esModuleInterop": true,
        "moduleResolution": "node",
     }}

**webpack.config.js**

    const config = {
      ... 
      module: {
        rules: [
          {
            test: /\.(tsx?|js)$/,
            exclude: /node_modules/,
            use: 'ts-loader'
          },
        ],
      },

And this will work fine until you wand from you configuration more.

Sentry Stack Trace.

if you want correct stack traces

    { "compilerOptions": {
        "sourceRoot": "/",
        "inlineSources": true
     }}

**webpack.config.js**

    config = {
    	...
        devtool: 'source-map',
    }
    
Lazy Loading and chunks
  