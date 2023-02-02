"use strict";
const fp = require("fastify-plugin");
const pgp = require("pg-promise")();

const configuration = require("../config/postgres");

module.exports = fp(function(fastify, opts, done) {
  try {
    const db = pgp(configuration.postgresUri);
  fastify.decorate("postgres", db);
  } catch (e) {
    console.error('ERROR', e)
  }
  
  done();
});
