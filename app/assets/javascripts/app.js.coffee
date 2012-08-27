class window.App
  labelPhotos: ->
    $.each $('#photos img'), (i, p) ->
      photo     = $(p)
      alt       = photo.attr('alt')
      container = $('<div></div>').addClass('image-container')
      caption   = $('<div></div>').html(alt).addClass('alt-message')
      photo.wrap(container)
      photo.after(caption)

  loadTweets: ->
    tweet_url = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=columbusrb&count=15&trim_user=1&exclude_replies=1"

    $.ajax
      url: tweet_url
      dataType: "jsonp"
      success: (data) =>
        new Tweet(tweet) for tweet in data

