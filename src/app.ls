require! './config': config
require! mongodb: {MongoClient}

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

do function start
    connection <- get-connection!then
    db = connection.db config.mongo.db
    app <- get-app db, \stock-exchange .then
    console.log app
    connection.close!

