ShoppingFarm.Admin.Views.Dealers ||= {}

class ShoppingFarm.Admin.Views.Dealers.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/dealers/index"]

  events:
    "click .new-dealer" : "new_dealer"
 
  constructor: (options) ->
    super(options)
    @collection.bind('reset', @addAll)
    #@collection.bind('change', @addAll)
  
  addAll: () =>
    @$("tbody").empty()
    @collection.each(@addOne)

  addOne: (dealer) =>
    view = new ShoppingFarm.Admin.Views.Dealers.DealerView({model : dealer, brands_collection: @options.brands_collection, collection: @collection})
    @$("tbody").append(view.render().el)

  new_dealer: (e) ->
    e.preventDefault()
    e.stopPropagation()

    new_view = new ShoppingFarm.Admin.Views.Dealers.NewView({collection: @collection, brands_collection: @options.brands_collection})
    $("#modal-body-content").html(new_view.render().el)
    $('#admin-modal-dialog').modal('show')

  render: =>
    $(@el).html(@template())
    
    return this
