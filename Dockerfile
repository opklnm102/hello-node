# build stage
FROM node:12.18.3

ARG VERSION
ARG MODULE_NAME

LABEL maintainer="opklnm102" version=${VERSION}

ENV APP_HOME=/home/app
RUN useradd --create-home app
USER app
WORKDIR ${APP_HOME}

RUN echo "${MODULE_NAME}, ${VERSION}"

## dependencies
COPY package.json yarn.lock ./

RUN yarn install --production

COPY --chown="app:app" app.js ./app.js
COPY --chown="app:app" docker-entrypoint.sh ./docker-entrypoint.sh

EXPOSE 3000
ENTRYPOINT ["/home/app/docker-entrypoint.sh"]
