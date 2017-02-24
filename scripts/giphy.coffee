# Description:
# Tries to find the best gif for you using Giphy's API
#
# Dependencies:
# none
#
# Configuration:
# process.env.HUBOT_GIPHY_API_KEY = <your giphy API key>
#
# Commands:
# hubot gif me (something) - Translates your phrase into gif form
# hubot another gif for (something) - Just runs the tag search
#
# Author:
# eric@softwareforgood
#
# Notes:
# This script will first pass your phrase to Giphy's translate endpoint
# If that endpoint does not find a gif, it will pass your phrase as tags to the
# random endpoint. It will use less and less tags until it finds an image
# r rated images are hardcoded to never be returned


API_KEY = process.env.HUBOT_GIPHY_API_KEY or 'dc6zaTOxFJmzC' # public API key

getTranslatedGif = (msg, phrase) ->
  url = 'http://api.giphy.com/v1/gifs/translate?api_key=' + API_KEY
  url += '&s=' + escape(phrase)
  msg.http(url).get() (err, res, body) ->
    response = JSON.parse(body)
    if response.data and response.data.rating == 'r'
      getTranslatedGif(msg, phrase)
    else if response.data and response.data.images and response.data.images.original
      msg.send(response.data.images.original.url)
    else
      getTaggedGif(msg, phrase)


getTaggedGif = (msg, tags) ->
  url = 'http://api.giphy.com/v1/gifs/random?api_key=' + API_KEY
  url += '&tag=' + escape(tags)
  msg.http(url).get() (err, res, body) ->
    response = JSON.parse(body)
    if response.data
      if response.data.rating and response.data.rating == 'r'
        getTaggedGif(msg, tags)
      else if response.data.image_url
        msg.send(response.data.image_url)
      else
        array_tags = tags.split(" ")
        if array_tags.length > 1
          array_tags.pop()
          tags = array_tags.join(" ")
          getTaggedGif(msg, tags)
    else
      msg.send "Sorry, but I couldn't find a gif for you."


module.exports = (robot) ->
  robot.respond /gif me (.*)/i, (msg) ->
    phrase = msg.match[1]
    getTranslatedGif(msg, phrase)

  robot.respond /another gif for (.*)/i, (msg) ->
    tags = msg.match[1]
    getTaggedGif(msg, tags)
