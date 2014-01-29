ShoppingFarm.Admin.Views.Brands ||= {}

class ShoppingFarm.Admin.Views.Brands.NewView extends Backbone.View
  template: JST["backbone_admin/templates/brands/new"]
  
  events: "submit #brand" : "save"
  
  bindings:
   '[name=identificator]': 
      observe: 'identificator'
      setOptions:
        validate: true
    '[name=title]': 
      observe: 'title'
    '[name=short_description]': 
      observe: 'short_description'
    '[name=full_description]': 
      observe: 'full_description'

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.brand_pictures_collection})
    
    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    if @model.isValid(true)
      @model.save(null,
        success: (brand) =>
          @collection.add(@model)
          @model.update_pictures_with_brand_id()
          $('#admin-modal-dialog').modal('hide')
        error: (customer_proposal, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )
  
  render: =>
    $(@el).html(@template())
    @$("#product-pictures").html(@picture_uploader.render().el)
    @stickit()

    return this
