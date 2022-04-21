# build
FROM node:14.15.3-alpine AS base

ARG VERSION=latest

LABEL maintainer="opklnm102" version=${VERSION}

ENV NODE_ENV=production
ENV APP_HOME=/home/app

RUN adduser -D app
USER app
WORKDIR ${APP_HOME}

EXPOSE 3000

## dependencies
COPY --chown=app:app package*.json ./
RUN npm ci && npm cache clean --force

FROM base AS dev
ENV NODE_ENV=development
ENV PATH=/app/node_modules/.bin:$PATH

RUN npm install --only=development

FROM base AS source
COPY --chown=app:app . .

FROM source AS test
ENV NODE_ENV=development
ENV PATH=/home/app/node_modules/.bin:$PATH

COPY --from=dev /home/app/node_modules /home/app/node_modules

RUN eslint .
RUN npm test
CMD ["npm", "run", "test"]

FROM source AS runtime
ENTRYPOINT ["/home/app/docker-entrypoint.sh"]
