class window.MemberList
  constructor: (@el, memberArray) ->
    memberArray.each (m) => new Member(@el, m)

class window.Member
  constructor: (@el, @url) ->
    @display()

  display: ->
    $.get @url, =>
      img = $('<img></img>').attr('src', @url)
      @el.append(img)

