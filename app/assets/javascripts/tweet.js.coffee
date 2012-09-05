class window.RecentTweets
  constructor: (@el, @template) ->
    @loadTweets()

  loadTweets: ->
    tweet_url = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=columbusrb&count=15&trim_user=1&exclude_replies=1"

    $.ajax
      url: tweet_url
      dataType: "jsonp"
      success: (data) =>
        new Tweet(tweet, @el, @template) for tweet in data



class window.Tweet
  constructor: (@tweet, @el, @template) ->
    @display()

  display: ->
    text = @tweet.text.autoTwitterLink()
    time = Date.create(@tweet.created_at).relative()
    html = _.template(@template.html(), tweet: text, time: time)
    @el.append($("<li>").html(html))



String::autoTwitterLink = ->
  url    = /(https?\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g
  handle = /@(\w+)/g
  text   = this.replace(url, "<a href='$1'>$1</a>")
  text   = text.replace(handle, "<a href='http://twitter.com/$1'>@$1</a>")
