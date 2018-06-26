require! amqplib: amqp
require! './config': config
require! './logger': logger

start = ->
    logger.info "starting consumer with config #{config}"
    amqp.connect "amqp://#{config.rabbitmq-host}"
        .then (.create-channel!)
        .tap (.assert-queue config.session-queue, durable: no)
        .tap (-> logger.info "consuming messages from #{config.session-queue}")
        .then (.consume do
            config.session-queue
            (message) -> logger.info "received #{message.content}"
            no-ack: yes)
