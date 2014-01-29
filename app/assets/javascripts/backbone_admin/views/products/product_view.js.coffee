ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.ProductView extends Backbone.View
  template: JST["backbone_admin/templates/products/product"]
  tagName: "tr"
  
  constructor: (options) ->
    super(options)
    
  events:
    "click .destroy" : "destroy"
    "click .preview" : "show"

  show: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('show', @model)  

  destroy: () ->
    window.ShoppingFarm.Admin.DestroyPromptDialog( => 
      @model.destroy()
      this.remove()
    )
    
    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
