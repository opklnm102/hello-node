# build
FROM node:14.15.3-alpine AS builder

ARG VERSION=latest

LABEL maintainer="opklnm102" version=${VERSION}

## dependencies
COPY package*.json ./
RUN npm install

ENV APP_HOME=/home/app
RUN adduser -D app
USER app
WORKDIR ${APP_HOME}

COPY ./ ./

# runtime
FROM node:14.15.3-alpine

COPY package*.json ./
RUN npm install --production

ENV APP_HOME=/home/app
RUN adduser -D app
USER app
WORKDIR ${APP_HOME}

COPY --chown="app:app" --from=builder /home/app/app.js ./
COPY --chown="app:app" --from=builder /home/app/docker-entrypoint.sh ./

EXPOSE 3000
ENTRYPOINT ["/home/app/docker-entrypoint.sh"]
