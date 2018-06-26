require! amqplib: amqp
require! './config': config
require! './logger': logger

exchange = config.exchange.parameters

export start = ->
    logger.info "starting consumer with config #{config}"
    amqp.connect "amqp://#{config.host.rabbitmq}"
        .then (.create-channel!)
        .tap (.assert-exchange exchange, \fanout, durable: no)
        .then (channel) ->
            channel.assert-queue '', exclusive: yes
                .then ({queue}) ->
                    logger.info "waiting for messages in #queue"
                    channel.bind-queue queue, exchange, ''
                    channel.consume do
                        queue
                        (message) ->
                            logger.info " received #{message.content}"
                        no-ack: yes
