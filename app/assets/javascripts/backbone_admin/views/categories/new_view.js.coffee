ShoppingFarm.Admin.Views.Categories ||= {}

class ShoppingFarm.Admin.Views.Categories.NewView extends Backbone.View
  template: JST["backbone_admin/templates/categories/new"]
  
  events: "submit #category" : "save"
  
  bindings:
    '[name=identificator]': 
      observe: 'identificator'
      setOptions:
        validate: true
    '[name=title]': 
      observe: 'title'
      setOptions:
        validate: true
        
  constructor: (options) ->
    super(options)
    
    Backbone.Validation.bind(this)
  
  save: (e) =>
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    if @model.isValid(true)
      @model.save(null,
        success: (category) =>
          $('#admin-modal-dialog').modal('hide')
          @collection.fetch()
        error: (category, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )
  
  render: =>
    $(@el).html(@template())
    @stickit()
    return this
