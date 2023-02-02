# Use Node v18
FROM node:18-alpine as builder

LABEL version="3.0.0"
LABEL description="Ultri Open Platform API"
LABEL maintainer="Brian Winkers <brian@ultri.com>"

# Create API app directory in container
WORKDIR /usr/src/api

ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=info

# Install global NPM packages
RUN npm install npm@latest fastify-cli -g

RUN apk --update add postgresql-client

# Copy the api specific package info to the Docker image
COPY --chown=node:node package*.json ./

# Run npm install on the image
RUN npm install --quiet --unsafe-perm --no-progress --no-audit --only=production

COPY . .

# FROM prereq as development

# RUN npm install --quiet --unsafe-perm --no-progress --no-audit --only=development

USER node

# Expose the default Fastify port, 3000. 
EXPOSE 3000

ENV FASTIFY_PORT = 3000

CMD [ "npm", "run", "start" ]