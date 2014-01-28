ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.EditView extends Backbone.View
  template: JST["backbone_admin/templates/pages/edit"]
  
  events: "submit #page" : "save"
  
  bindings:
   '[name=content]': 
      observe: 'content'
      setOptions:
        validate: true

  constructor: (options) ->
    super(options)
    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    if @model.isValid(true)
      @model.set({content: CKEDITOR.instances['content'].getData()})
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

    @stickit()
    return this
