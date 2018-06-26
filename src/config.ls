localhost = '127.0.0.1'

module.exports =
    mongo:
        host: process.env.MONGO_HOST or localhost
        port: process.env.MONGO_PORT or '27017'
        db: process.env.MONGO_DB or 'rung'
    to-string: ->
        JSON.stringify @, null, 2
