#!/usr/bin/env node
require! 'amqplib/callback_api': amqp

_, connection <- amqp.connect 'amqp://localhost'
_, channel <- connection.create-channel

channel.assert-queue 'hello', durable: no
channel.send-to-queue 'hello', (new Buffer 'Foo!')

console.log 'yaaay'

