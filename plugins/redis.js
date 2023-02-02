"use strict";
const fp = require("fastify-plugin");
const fastifyRedis = require('@fastify/redis')

const configuration = require("../config/redis");

module.exports = fp(function(fastify, opts, done) {
  try {
    fastify.register(fastifyRedis, { url: configuration.redisUri, /* other redis options */ })
  } catch (e) {
    console.error(e)
  }

  done();
  
});