ShoppingFarm.Admin.Views.Brands ||= {}

class ShoppingFarm.Admin.Views.Brands.EditView extends Backbone.View
  template : JST["backbone_admin/templates/brands/edit"]

  events :
    "submit #brand" : "update"
  
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

    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.brand_pictures_collection})
    @model.fetch_brand_pictures()
    
    Backbone.Validation.bind(this)

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    if @model.isValid(true)
      @model.save(null,
        success : (customer_proposal) =>
          @model.update_pictures_with_brand_id()
          $('#admin-modal-dialog').modal('hide')
      )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)
    @stickit()

    return this
