ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.NewView extends Backbone.View
  template: JST["backbone_admin/templates/products/new"]
  
  events: "submit #product" : "save"
  
  bindings:
   '[name=product_name]': 
      observe: 'product_name'
      setOptions:
        validate: true
   '[name=brand_id]': 
      observe: 'brand_id'
      setOptions:
        validate: true

  constructor: (options) ->
    super(options)
    @options = options

    @model = new @collection.model()

    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.product_pictures_collection})

    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    
    if @model.isValid(true)
      @model.save(null,
        success: () =>
          @model.update_pictures_with_product_id()
          @collection.add(@model)
          @collection.trigger('reset')
          $('#admin-modal-dialog').modal('hide')

        error: (customer_proposal, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )


  init_brand_select2: () =>
    @$("#brand_id").select2({
      data: @options.brands_collection.select2_data()
      placeholder: "Выберите бренд"
    })

  render: =>
    $(@el).html(@template())
    @$("#product-pictures").html(@picture_uploader.render().el)
    
    @stickit()
    @init_brand_select2()
    return this
