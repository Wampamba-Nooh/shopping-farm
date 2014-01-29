ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.EditView extends Backbone.View
  template : JST["backbone_admin/templates/products/edit"]

  events: "submit #product" : "update"
  
  bindings:
    '[name=identificator]': 
      observe: 'identificator'
      setOptions:
        validate: true   
    '[name=short_description]': 
      observe: 'short_description'
      setOptions:
        validate: true   
    '[name=full_description]': 
      observe: 'full_description'
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

    @model.set({short_description: CKEDITOR.instances['short_description'].getData()})
    @model.set({full_description: CKEDITOR.instances['full_description'].getData()})
    
    if @model.isValid(true)
      @model.save(null,
        success : () =>
          @model.update_pictures_with_product_id()
          Backbone.history.navigate('products', true);
        error: (product, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)

    CKEDITOR.replace(@$('#short_description')[0])
    CKEDITOR.replace(@$('#full_description')[0])

    @stickit()
    @init_brand_select2()
    return this
