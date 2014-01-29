ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.PageView extends Backbone.View
  template: JST["backbone_admin/templates/pages/page"]
  tagName: "tr"

  events:
    "click .destroy" : "destroy"
  
  destroy: () ->
    window.ShoppingFarm.Admin.DestroyPromptDialog( => 
      @model.destroy()
      this.remove()
    )
    
    return false
  
  render: ->
    $(@el).html(@template(@model.toJSON() ))
    
    return this
