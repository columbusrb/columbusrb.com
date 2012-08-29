class window.MainNav
  constructor: (@initialPath) ->
    @markInitialActiveItem()
    @watch()

  markInitialActiveItem: ->
    $("a[href='#{@initialPath}']").parents('.menu-item').addClass('active')

  watch: ->
    $('a[data-pjax]').pjax('[data-pjax-container]').on 'click', (e) =>
      @clearActiveItem()
      $(e.target).parents('.menu-item').addClass('active')

  clearActiveItem: ->
    $('#nav .menu-item').removeClass('active')



