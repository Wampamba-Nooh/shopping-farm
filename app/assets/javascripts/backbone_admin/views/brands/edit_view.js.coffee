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
    '[name=category_ids]':
       observe: 'category_ids'

  constructor: (options) ->
    super(options)
    @options = options
    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.brand_pictures_collection})
    @model.fetch_brand_pictures()
    
    Backbone.Validation.bind(this)

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.set('category_ids', @$("#category_ids").select2('val'))
    if @model.isValid(true)
      @model.save(null,
        success : (customer_proposal) =>
          @model.update_pictures_with_brand_id()
          $('#admin-modal-dialog').modal('hide')
      )
  
  init_categories_select2: () =>
    @$("#category_ids").select2({
      data: @options.categories_collection.toJSON()
      placeholder: "Выберите категории"
      multiple: true
      width: 300
      formatResult: (item) ->
        return item.identificator
      formatSelection: (item) ->
        return item.identificator
    })
    @$("#category_ids").select2('val', @model.get('category_ids'))

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)
    @init_categories_select2()
    @stickit()

    return this
