class ShoppingFarm.Admin.Models.Category extends Backbone.RelationalModel
  paramRoot: 'category'
  
  defaults:
    identificator: null
    title: null
  
  constructor: (options) ->
    super(options)
    @category_pictures_collection = new ShoppingFarm.Admin.Collections.CategoryPicturesCollection()
  
  fetch_brand_pictures: () =>
    @category_pictures_collection.fetch(
      url: "/admin/categories/#{@.id}/pictures"
    )
  
  update_pictures_with_category_id: () =>
    @category_pictures_collection.each( (item) =>
      item.set({category_id: @.id})
      item.save()
    )
  
  idAttribute: 'id'
  
  relations: [
    {
      type: Backbone.HasMany
      key: 'children'
      relatedModel: 'ShoppingFarm.Admin.Models.Category'
      #reverseRelation: {
      #  key: 'parent_id'
      #  includeInJSON: 'parent_id'
      #}
    }    
    {
      type: Backbone.HasMany
      key: 'products'
      relatedModel: 'ShoppingFarm.Admin.Models.Product'
      #reverseRelation: {
      #  key: 'parent_id'
      #  includeInJSON: 'parent_id'
      #}
    }

  ]

  validation: 
    identificator: 
      required: true
      msg: 'Ошибка'
    title: 
      required: true
      msg: 'Ошибка'

  urlRoot: '/admin/categories'


class ShoppingFarm.Admin.Collections.CategoriesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Category
  url: '/admin/categories'
