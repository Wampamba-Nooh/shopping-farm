ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.NewView extends Backbone.View
  template: JST["backbone_admin/templates/pages/new"]
  
  events: "submit #page" : "save"
  
  bindings:
    '[name=identificator]': 
      observe: 'identificator'
    '[name=title]': 
      observe: 'title'
    '[name=short_content]': 
      observe: 'short_content'
    '[name=full_content]': 
      observe: 'full_content'

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    if @model.isValid(true)
      @model.set({full_content: CKEDITOR.instances['full_content'].getData()})
      @model.set({short_content: CKEDITOR.instances['short_content'].getData()})
      @model.save(null,
        success: (dealer) =>
          Backbone.history.navigate('pages', true)
        error: (dealer, jqXHR) =>
          errors = JSON.parse(jqXHR.responseText)
          _.each(errors, (val, attr) =>
            Backbone.Validation.callbacks.invalid(@, attr, val, 'name')
          )
          @model.trigger('validated', false, @model, errors)
          @model.trigger('validated:invalid', @model, errors)
      )

  render: =>
    $(@el).html(@template(@model.toJSON()))
    CKEDITOR.replace(@$('#full_content')[0])
    CKEDITOR.replace(@$('#short_content')[0])
    @stickit()

    return this
