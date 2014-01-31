ShoppingFarm.Admin.Views.Manufacturers ||= {}

class ShoppingFarm.Admin.Views.Manufacturers.EditView extends Backbone.View
  template : JST["backbone_admin/templates/manufacturers/edit"]

  events :
    "submit #manufacturer" : "update"
  
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
    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.manufacturer_pictures_collection})
    @model.fetch_manufacturer_pictures()
    
    Backbone.Validation.bind(this)

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.set('category_ids', @$("#category_ids").select2('val'))
    if @model.isValid(true)
      @model.save(null,
        success : (customer_proposal) =>
          @model.update_pictures_with_manufacturer_id()
          $('#admin-modal-dialog').modal('hide')
      )
  
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

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)
    @init_categories_select2()
    @stickit()

    return this
