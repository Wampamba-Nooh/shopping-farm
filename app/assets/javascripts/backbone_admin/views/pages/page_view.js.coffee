ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.PageView extends Backbone.View
  template: JST["backbone_admin/templates/pages/page"]
  tagName: "tr"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    
    return this
