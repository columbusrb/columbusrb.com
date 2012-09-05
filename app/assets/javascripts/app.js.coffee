class window.App
  constructor: ->
    @loadBindings()
    @watchCodeJamSlider()

  loadBindings: ->
    $('#crb').bigtext()

  watchCodeJamSlider: ->
    $('a#code-jam-slider').on 'click', (e) ->
      e.preventDefault()
      $('#code_jam').animate({"margin-right": "0px"})
      $('#overlay').animate({"opacity": 0.5})

    $('a#close-jam').on 'click', (e) ->
      e.preventDefault()
      $('#code_jam').animate({"margin-right": "-312px"})
      $('#overlay').animate({"opacity": 1.0})
