ShoppingFarmFileUploader.Views.Uploader ||= {}

class ShoppingFarmFileUploader.Views.Uploader.UploadProgressView extends Backbone.View
  template: JST["backbone_file_uploader/templates/uploader/upload_progress"]

  events:
    "click #status" : "destroy"

  tagName: "div"
  className: "progress"

  initialize: () ->
    @model.on('change:preview80x80',@render_picture,@);

  render_picture: () =>
    @$(".picture").html("<img src=\"#{@model.get('preview80x80')}\">")

  destroy: () ->
    @model.destroy()
        
    this.remove()
    return false

  render: ->
    @model.set('cid', @model.cid)
    $(@el).html(@template(@model.toJSON() ))
    return this
