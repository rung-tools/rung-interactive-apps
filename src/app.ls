require! './config': config
require! mongodb: {MongoClient}
require! 'uuid/v4': uuid

sessions = {}

get-connection = ->
    MongoClient.connect "mongodb://#{config.mongo.host}:#{config.mongo.port}"

get-app = (db, name) ->
    db.collection \metaextensions .find-one name: name, do
        projection:
            _id: yes
            name: yes
            source: yes
            fields: yes
            locales: yes

create-session = (db, app-name, locale) ->
    session-id = uuid!
    app <- get-app db, app-name .then
    context = do
        locale: locale
    sessions[session-id] = do
        id: session-id
        locale: locale
    sessions[session-id]

do function start
    connection <- get-connection!then
    db = connection.db config.mongo.db
    session <- create-session db, \stock-exchange, \pt_BR .then
    console.log session
    connection.close!

