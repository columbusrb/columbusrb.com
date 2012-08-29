class window.PhotoPage
  labelAll: ->
    $.each $('#photos img'), (i, p) ->
      photo     = $(p)
      alt       = photo.attr('alt')
      container = $('<div></div>').addClass('image-container').addClass('span3')
      caption   = $('<div></div>').html(alt).addClass('alt-message')
      photo.wrap(container)
      photo.after(caption)
