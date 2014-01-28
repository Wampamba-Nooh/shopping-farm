ShoppingFarm.Admin.Views.Categories ||= {}

class ShoppingFarm.Admin.Views.Categories.CategoryView extends Backbone.View
  template: JST["backbone_admin/templates/categories/category"]
  #tagName: "tr"
  
  #events:
  #  "click .destroy" : "destroy"

  #destroy: () ->
  #  window.ShoppingFarm.Admin.DestroyPromptDialog( => 
  #    @model.destroy()
  #    this.remove()
  #  )
  #  return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
