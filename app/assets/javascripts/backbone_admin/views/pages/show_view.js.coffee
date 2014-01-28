ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.ShowView extends Backbone.View
  template: JST["backbone_admin/templates/pages/show"]
  tagName: "div"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    
    @$("#content").html(@model.get('content'))

    return this
