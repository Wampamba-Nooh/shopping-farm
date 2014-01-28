ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/products/index"]

  events:
    "click .new-product" : "new_product"
  
  initialize: () ->
  
  constructor: (options) ->
    super(options)
    @options = options

    @collection.off('sync')
    @collection.on('sync', @addAll)

  addAll: () =>
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (product) =>
    view = new ShoppingFarm.Admin.Views.Products.ProductView({model : product})
    view.on('edit', @edit_product)
    view.on('show', @show_product)
    @$("tbody").append(view.render().el)

  show_product: (m) =>
    edit_view = new ShoppingFarm.Admin.Views.Products.ShowView({brands_collection: @options.brands_collection, model: m, collection: @collection})
    $("#modal-body-content").html(edit_view.render().el)
    $('#admin-modal-dialog').modal('show')
    
  edit_product: (m) =>
    edit_view = new ShoppingFarm.Admin.Views.Products.EditView({brands_collection: @options.brands_collection, model: m, collection: @collection})
    $("#modal-body-content").html(edit_view.render().el)
    $('#admin-modal-dialog').modal('show')

  new_product: (e) =>
    e.preventDefault()
    e.stopPropagation()

    new_view = new ShoppingFarm.Admin.Views.Products.NewView({brands_collection: @options.brands_collection, collection: @collection})
    $("#modal-body-content").html(new_view.render().el)
    $('#admin-modal-dialog').modal('show')

  render: =>
    $(@el).html(@template())
    
    @addAll()
    return this
