ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.ShowView extends Backbone.View
  template: JST["backbone_admin/templates/products/show"]
  tagName: "div"
  
  constructor: (options) ->
    super(options)

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
