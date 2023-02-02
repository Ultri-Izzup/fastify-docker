# Ultri Fastify Docker

A Fastify API Docker container optimized for the Ultri Open Platform.

## Build API Container

```sh
docker build -t ultri-api .
```

## Run API Container

```sh
docker run -p 3500:3000 --env-file .env --name ultri-api -it ultri-api
```

## Tag Image for Docker Hub

```sh
docker image tag ultri-api ultri/open-platform-api:latest
```

## Push to Docker Hub

```sh
docker image push ultri/open-platform-api:latest
```

## Docker Compose Usage




