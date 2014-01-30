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
    '[name=parent_id]':
       observe: 'parent_id'

  constructor: (options) ->
    super(options)
    @picture_uploader = new ShoppingFarmFileUploader.Views.Uploader.IndexView({collection: @model.category_pictures_collection})
    @model.fetch_brand_pictures()
    Backbone.Validation.bind(this)
  
  init_categories_select2: () =>
    @$("#parent_id").select2({
      data: @collection.toJSON()
      placeholder: "Выберите категории"
      #multiple: true
      width: 300
      formatResult: (item) ->
        "#{item.title}"
      formatSelection: (item) ->
        return "#{item.title}"
    })
    @$("#parent_id").select2('val', @model.get('parent_id'))
 
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
  
    if @model.isValid(true)
      @model.save(null,
        success : (customer_proposal) =>
          @model.update_pictures_with_category_id()
          @collection.fetch()
          $('#admin-modal-dialog').modal('hide')
      )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @$("#product-pictures").html(@picture_uploader.render().el)
    @init_categories_select2()
    @stickit()

    return this
