localhost = '127.0.0.1'

module.exports =
    host:
        redis: process.env.REDIS_HOST or localhost
        mongo: process.env.MONGO_HOST or localhost
        rabbitmq: process.env.RABBITMQ_HOST or localhost
    exchange:
        parameters: process.env.PARAMETERS_EXCHANGE or 'parameters'
    to-string: ->
        JSON.stringify @, null, 2
