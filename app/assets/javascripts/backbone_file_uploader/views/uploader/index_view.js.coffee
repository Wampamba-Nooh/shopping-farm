ShoppingFarmFileUploader.Views.Uploader ||= {}

class ShoppingFarmFileUploader.Views.Uploader.IndexView extends Backbone.View
  template: JST["backbone_file_uploader/templates/uploader/index"]
  
  constructor: (options) ->
    super(options)
    @collection.off("sync")
    @collection.on("sync", @addAll)
  
  initialize: () ->
  
  addAll: () =>
    @$("#uploads-table").empty()
    @collection.each(@addOne)

  addOne: (picture) =>
    upload_model_view = new ShoppingFarmFileUploader.Views.Uploader.UploadView({model: picture})
    upload_model_rendered = upload_model_view.render().el
    @$("#uploads-table").append(upload_model_rendered)

    return upload_model_rendered

  addProgressOne: (picture) =>
    upload_model_view = new ShoppingFarmFileUploader.Views.Uploader.UploadProgressView({model: picture})
    upload_model_rendered = upload_model_view.render().el
    @$("#uploads-table").append(upload_model_rendered)

    return upload_model_rendered

  render: =>
    $(@el).html(@template())
    @addAll()
    @$('input.fileupload').fileupload({
      dataType: 'json'
      url: @collection.url
      done: (e, data) =>
        if data.context
          data.context.find('.label-in').addClass("success")
          data.context.find('#status').html("<a href=\"#\"><span class=\"glyphicon glyphicon-remove\"></span></a>")
          cid = data.context.find('.file').attr('id')
          loaded_model = _.find(@collection.models, (o) -> 
            o.cid == cid
          )
          loaded_model.id = data.result.id
          loaded_model.set(data.result)

      add: (e, data) =>
        #types = /(\.|\/)(gif|jpe?g|png)$/i
        file = data.files[0]
        #if types.test(file.type) || types.test(file.name)
        upload_model = new @collection.model()
        @collection.add(upload_model)
        upload_model_rendered = @addProgressOne(upload_model)
        
        data.context = $(upload_model_rendered)
        data.submit()
        #else
        #  alert("#{file.name} is not a gif, jpeg, or png image file")
        #file_json = $.parseJSON(jqXHR.responseText)
        
      progress: (e, data) ->
        if data.context
          progress_val = parseInt(data.loaded / data.total * 100, 10)
          data.context.find('#status').html("#{progress_val}%")
    })

    return this
