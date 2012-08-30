class window.MainNav

  constructor: (@initialPath) ->
    @loadBindings()
    @markInitialActiveItem()
    @watch()

  loadBindings: ->
    $.pjax.defaults.scrollTo = false

  markInitialActiveItem: ->
    $("a[href='#{@initialPath}']").parents('.menu-item').addClass('active')

  watch: ->
    $('a[data-pjax]').pjax('[data-pjax-container]').on 'click', (e) =>
      @clearActiveItem()
      $(e.target).parents('.menu-item').addClass('active')

  clearActiveItem: ->
    $('#nav .menu-item').removeClass('active')

