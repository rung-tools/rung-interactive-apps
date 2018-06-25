localhost = '127.0.0.1'

module.exports =
    redis-host: process.env.REDIS_HOST or localhost
    mongo-host: process.env.MONGO_HOST or localhost
    rabbitmq-host: process.env.RABBITMQ_HOST or localhost
    session-queue: process.env.QUEUE_NAME or 'session-queue'
