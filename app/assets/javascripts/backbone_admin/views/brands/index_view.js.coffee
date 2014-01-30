ShoppingFarm.Admin.Views.Brands ||= {}

class ShoppingFarm.Admin.Views.Brands.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/brands/index"]

  events:
    "click .new-brand" : "new_brand"
 
  constructor: (options) ->
    super(options)
    @options = options
    @collection.off('sync')
    @collection.on('sync', @addAll)
  
  addAll: () =>
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (brand) =>
    view = new ShoppingFarm.Admin.Views.Brands.BrandView({model : brand})
    view.on('edit', @edit_brand)
    @$("tbody").append(view.render().el)

  edit_brand: (m) =>
    console.log(@options)
    edit_view = new ShoppingFarm.Admin.Views.Brands.EditView({model: m, categories_collection: @options.categories_collection})
    $("#modal-body-content").html(edit_view.render().el)
    $('#admin-modal-dialog').modal('show')    

  new_brand: (e) =>
    e.preventDefault()
    e.stopPropagation()

    new_view = new ShoppingFarm.Admin.Views.Brands.NewView({collection: @collection, categories_collection: @options.categories_collection})
    $("#modal-body-content").html(new_view.render().el)
    $('#admin-modal-dialog').modal('show')

  render: =>
    $(@el).html(@template())
    
    return this
