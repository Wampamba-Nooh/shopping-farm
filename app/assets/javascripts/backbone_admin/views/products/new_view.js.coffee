ShoppingFarm.Admin.Views.Products ||= {}

class ShoppingFarm.Admin.Views.Products.NewView extends Backbone.View
  template: JST["backbone_admin/templates/products/new"]
  
  events: "submit #product" : "save"
  
  bindings:
    '[name=identificator]': 
      observe: 'identificator'
      setOptions:
        validate: true   
    '[name=short_description]': 
      observe: 'short_description'
      setOptions:
        validate: true       
    '[name=title]': 
      observe: 'title'
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
    '[name=category_ids]':
       observe: 'category_ids'


  constructor: (options) ->
    super(options)
    @options = options

    @model = new @collection.model()
    
    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.product_pictures_collection})
        
    @options.categories_collection.off('sync')
    @options.categories_collection.on('sync', @init_categories_select2)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    
    @model.set({short_description: CKEDITOR.instances['short_description'].getData()})
    @model.set({full_description: CKEDITOR.instances['full_description'].getData()})
    @model.set('category_ids', @$("#category_ids").select2('val'))
    
    if @model.isValid(true)
      @model.save(null,
        success: () =>
          @model.update_pictures_with_product_id()
          Backbone.history.navigate('products', true)

        error: (customer_proposal, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )


  init_brand_select2: () =>
    @$("#brand_id").select2({
      data: @options.brands_collection.select2_data()
      placeholder: "Выберите бренд"
    }) 

  init_categories_select2: () =>
    @$("#category_ids").select2({
      data: @options.categories_collection.toJSON()
      placeholder: "Выберите категории"
      multiple: true
      width: 300
      formatResult: (item) ->
        "#{item.title}"
      formatSelection: (item) ->
        return "#{item.title}"
    })
    @$("#category_ids").select2('val', @model.get('category_ids'))

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)

    CKEDITOR.replace(@$('#short_description')[0])
    CKEDITOR.replace(@$('#full_description')[0])
    @init_brand_select2()
    @stickit()

    return this
