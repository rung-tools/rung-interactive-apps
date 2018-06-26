require! amqplib: amqp
require! './consumer': consumer
require! './logger': logger

bail = ({stack}) !->
    logger.error stack
    process.exit 1

process.on \uncaughtException, bail
process.on \unhandledException, bail

do consumer.start
