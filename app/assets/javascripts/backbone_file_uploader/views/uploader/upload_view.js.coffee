ShoppingFarmFileUploader.Views.Uploader ||= {}

class ShoppingFarmFileUploader.Views.Uploader.UploadView extends Backbone.View
  template: JST["backbone_file_uploader/templates/uploader/upload"]

  events:
    "click #status" : "destroy"

  tagName: "div"
  className: "progress"

  render_picture: () =>
    @$(".picture").html("<img src=\"#{@model.get('preview80x80')}\">")

  destroy: () ->
    @model.destroy()
        
    this.remove()
    return false

  render: ->
    @model.set('cid', @model.cid)
    
    $(@el).html(@template(@model.toJSON() ))
    @render_picture()

    return this
