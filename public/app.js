function autoLinkTweet(text){
  var urlRegex = /(https?\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g;
  text = text.replace(urlRegex, "<a href='$1'>$1</a>");
  text = text.replace(/@(\w+)/gi, "<a href='http://twitter.com/$1'>@$1</a>");
  return text;
};

function loadTweets(){
  var div = $('#tweets');
  var url = "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=columbusrb&count=5&trim_user=1&exclude_replies=1";

  $.ajax({
    url: url,
    dataType: 'jsonp',
    success: function(data){
      for(var i=0; i<5; i++){
        var tweet = data[i];
        var text  = autoLinkTweet(tweet.text);
        var li    = $('<li>').html(text);
        div.append(li);
      }
    }
  });
};

$(window).load(function(){
  loadTweets();
});
