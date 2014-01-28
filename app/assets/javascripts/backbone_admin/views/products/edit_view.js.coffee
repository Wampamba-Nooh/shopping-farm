ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.EditView extends Backbone.View
  template : JST["backbone_admin/templates/products/edit"]

  events: "submit #product" : "update"
  
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
    
    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.product_pictures_collection})
    @model.fetch_product_pictures()

    Backbone.Validation.bind(this)
 
  init_brand_select2: () =>
    @$("#brand_id").select2({
      data: @options.brands_collection.select2_data()
      placeholder: "Выберите бренд"
    })

    @$("#brand_id").select2('val', @model.get('brand_id'))

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    
    if @model.isValid(true)
      @model.save(null,
        success : () =>
          @model.update_pictures_with_product_id()
          $('#admin-modal-dialog').modal('hide')
          @model.fetch
            complete: =>
              @collection.trigger('reset')
        error: (product, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)
    CKEDITOR.replace(@$('#content')[0])
    @stickit()
    @init_brand_select2()
    return this
