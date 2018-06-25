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
    amqp.connect "amqp://#{config.rabbitmq-host}"
        .then (.create-channel!)
        .tap (.assert-queue config.session-queue)
        .tap (-> logger.info "consuming messages from #{config.session-queue}")
        .then (channel) ->
            console.log channel
