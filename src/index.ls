require! amqplib: amqp
require! './config': config
require! './logger': logger

bail = ({stack}) !->
    logger.error stack
    process.exit 1

process.on \uncaughtException, bail
process.on \unhandledException, bail

do function start
    logger.info "environment is #{JSON.stringify config, null, 2}"
