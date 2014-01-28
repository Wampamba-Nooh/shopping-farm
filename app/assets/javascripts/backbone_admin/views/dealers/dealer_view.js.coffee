ShoppingFarm.Admin.Views.Dealers ||= {}

class ShoppingFarm.Admin.Views.Dealers.DealerView extends Backbone.View
  template: JST["backbone_admin/templates/dealers/dealer"]
  tagName: "tr"
  
  events:
    "click .destroy" : "destroy"
    "click .edit" : "edit"
    "click .preview" : "preview"

  preview: (e) =>
    e.preventDefault()
    e.stopPropagation()

    show_view = new ShoppingFarm.Admin.Views.Dealers.ShowView({model: @model, brands_collection: @options.brands_collection})
    $("#modal-body-content").html(show_view.render().el)
    $('#admin-modal-dialog').modal('show')
  
  edit: (e) =>
    e.preventDefault()
    e.stopPropagation()
    @model.fetch
      complete: =>
        edit_view = new ShoppingFarm.Admin.Views.Dealers.EditView({model: @model, brands_collection: @options.brands_collection, collection: @collection})
        $("#modal-body-content").html(edit_view.render().el)
        $('#admin-modal-dialog').modal('show')
    
  destroy: () ->
    window.ShoppingFarm.Admin.DestroyPromptDialog( => 
      @model.destroy()
      this.remove()
    )
    
    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
