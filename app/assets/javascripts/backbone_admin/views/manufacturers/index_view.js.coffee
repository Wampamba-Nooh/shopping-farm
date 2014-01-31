ShoppingFarm.Admin.Views.Manufacturers ||= {}

class ShoppingFarm.Admin.Views.Manufacturers.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/manufacturers/index"]

  events:
    "click .new-manufacturer" : "new_manufacturer"
 
  constructor: (options) ->
    super(options)
    @options = options
    @collection.off('sync')
    @collection.on('sync', @addAll)
  
  addAll: () =>
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (brand) =>
    view = new ShoppingFarm.Admin.Views.Manufacturers.ManufacturerView({model : brand})
    view.on('edit', @edit_manufacturer)
    @$("tbody").append(view.render().el)

  edit_manufacturer: (m) =>
    console.log(@options)
    edit_view = new ShoppingFarm.Admin.Views.Manufacturers.EditView({model: m, categories_collection: @options.categories_collection})
    $("#modal-body-content").html(edit_view.render().el)
    $('#admin-modal-dialog').modal('show')    

  new_manufacturer: (e) =>
    e.preventDefault()
    e.stopPropagation()

    new_view = new ShoppingFarm.Admin.Views.Manufacturers.NewView({collection: @collection, categories_collection: @options.categories_collection})
    $("#modal-body-content").html(new_view.render().el)
    $('#admin-modal-dialog').modal('show')

  render: =>
    $(@el).html(@template())
    
    return this
