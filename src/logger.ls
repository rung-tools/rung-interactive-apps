require! winston: {format}: winston

module.exports = winston.create-logger do
    transports: [new winston.transports.Console!]
    format: format.combine do
        format.colorize!
        format.splat!
        format.simple!
