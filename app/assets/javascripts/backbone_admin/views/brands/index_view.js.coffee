ShoppingFarm.Admin.Views.Brands ||= {}

class ShoppingFarm.Admin.Views.Brands.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/brands/index"]

  events:
    "click .new-brand" : "new_brand"
 
  constructor: (options) ->
    super(options)
    @collection.off('sync')
    @collection.on('sync', @addAll)
  
  addAll: () =>
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (brand) =>
    view = new ShoppingFarm.Admin.Views.Brands.BrandView({model : brand})
    @$("tbody").append(view.render().el)

  new_brand: (e) ->
    e.preventDefault()
    e.stopPropagation()

    new_view = new ShoppingFarm.Admin.Views.Brands.NewView({collection: @collection})
    $("#modal-body-content").html(new_view.render().el)
    $('#admin-modal-dialog').modal('show')

  render: =>
    $(@el).html(@template())
    
    return this
