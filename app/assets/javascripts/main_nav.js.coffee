class window.MainNav

  constructor: (@initialPath) ->
    @loadBindings()
    @markInitialActiveItem()
    @watch()

  loadBindings: ->
    $.pjax.defaults.scrollTo = false

  markInitialActiveItem: ->
    if @initialPath is '/' then @setFirstItemActive() else @setActiveItemByPath(@initialPath)

  setFirstItemActive: ->
    @markItemAsActive($("#nav a:first"))

  watch: ->
    $('a[data-pjax]').pjax('[data-pjax-container]').on 'click', (e) =>
      @markItemAsActive($(e.target))

    $('[data-pjax-container]').on "pjax:popstate", (e) =>
      path = @pathFromPopState(e)
      if path is '/' then @setFirstItemActive() else @setActiveItemByPath(path)

  clearActiveItem: ->
    $('#nav .menu-item').removeClass('active')

  setActiveItemByPath: (path) ->
    @markItemAsActive($("a[href='#{path}']"))

  markItemAsActive: (selector) ->
    @clearActiveItem()
    selector.parents('.menu-item').addClass('active')

  pathFromPopState: (e) ->
    "/#{e.state.url.split('/').last()}"
