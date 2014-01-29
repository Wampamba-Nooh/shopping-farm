ShoppingFarm.Front.Views.Distributors ||= {}

class ShoppingFarm.Front.Views.Distributors.ShowView extends Backbone.View
  template: JST["backbone_front/templates/distributors/show"]
  
  tagName: "div"
  
  constructor: (options) ->
    super(options)

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
