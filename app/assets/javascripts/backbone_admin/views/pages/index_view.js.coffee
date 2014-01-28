ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/pages/index"]
 
  constructor: (options) ->
    super(options)
    @collection.off('synd')
    @collection.on('sync', @addAll)

  addAll: () =>
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (page) =>
    view = new ShoppingFarm.Admin.Views.Pages.PageView({model : page})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template())
    
    return this
