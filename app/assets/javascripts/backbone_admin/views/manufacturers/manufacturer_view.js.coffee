ShoppingFarm.Admin.Views.Manufacturers ||= {}

class ShoppingFarm.Admin.Views.Manufacturers.ManufacturerView extends Backbone.View
  template: JST["backbone_admin/templates/manufacturers/manufacturer"]
  tagName: "tr"
  
  events:
    "click .destroy" : "destroy"
    "click .edit" : "edit"

  edit: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('edit', @model)
    
  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    window.ShoppingFarm.Admin.DestroyPromptDialog( => 
      @model.destroy()
      this.remove()
    )
    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
