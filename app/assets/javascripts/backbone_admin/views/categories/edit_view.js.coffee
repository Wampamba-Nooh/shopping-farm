ShoppingFarm.Admin.Views.Categories ||= {}

class ShoppingFarm.Admin.Views.Categories.EditView extends Backbone.View
  template : JST["backbone_admin/templates/categories/edit"]

  events :
    "submit #category" : "update"
  
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
  
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
  
    if @model.isValid(true)
      @model.save(null,
        success : (customer_proposal) =>
          $('#admin-modal-dialog').modal('hide')
      )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @stickit()

    return this