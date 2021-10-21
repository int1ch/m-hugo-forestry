#!/bin/sh
USER=mike
HOST=ml
DIR=m-hugo-forestry/public   # the directory where your web site files should go
ENV=production
X_ENV=env env | grep _ENV
HUGO_ENVIRONMENT=${ENV} NODE_ENV=${ENV} hugo && rsync -avz --delete public/ ${USER}@${HOST}:~/${DIR}

exit 0
