class window.Tweet
  constructor: (@tweet) ->
    @display()

  autoLink: (text) ->
    url    = /(https?\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g
    handle = /@(\w+)/g
    text   = text.replace(url, "<a href='$1'>$1</a>")
    text   = text.replace(handle, "<a href='http://twitter.com/$1'>@$1</a>")

  display: ->
    target   = $("#tweets")
    template = $("#tweetTemplate").html()
    text     = @autoLink(@tweet.text)
    time     = Date.create(@tweet.created_at).relative()
    html     = _.template(template,
      tweet: text
      time: time
    )
    li = $("<li>").html(html)
    target.append li


