ShoppingFarm.Admin.Views.Brands ||= {}

class ShoppingFarm.Admin.Views.Brands.NewView extends Backbone.View
  template: JST["backbone_admin/templates/brands/new"]
  
  events: "submit #brand" : "save"
  
  bindings:
   '[name=identificator]': 
      observe: 'identificator'
      setOptions:
        validate: true

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    if @model.isValid(true)
      @collection.create(@model.toJSON(),
        success: (brand) =>
          console.log(brand)
          @model = brand
          $('#admin-modal-dialog').modal('hide')
        error: (customer_proposal, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )
  
  render: =>
    $(@el).html(@template())
    @stickit()
    return this
