#*********************************************************************
# Copyright (c) Intel Corporation 2021
# SPDX-License-Identifier: Apache-2.0
#*********************************************************************/
### STAGE 1: Build ###
FROM node:14 AS build
WORKDIR /usr/src/app
COPY ./sample-web-ui/package.json ./sample-web-ui/package-lock.json ./
RUN npm ci
COPY ./sample-web-ui .
RUN npm run build -- --prod

### STAGE 2: Run ###
FROM nginx:latest

LABEL license='SPDX-License-Identifier: Apache-2.0' \
      copyright='Copyright (c) 2021: Intel'


COPY --from=build /usr/src/app/dist/openamtui /usr/share/nginx/html
COPY --from=build /usr/src/app/init.sh /docker-entrypoint.d/init.sh
EXPOSE 80

COPY ./sample-web-ui/nginx.conf /etc/nginx/conf.d/default.conf
