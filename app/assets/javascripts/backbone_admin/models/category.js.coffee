class ShoppingFarm.Admin.Models.Category extends Backbone.RelationalModel
  paramRoot: 'category'
  
  defaults:
    identificator: null
    title: null

  idAttribute: 'id'
  
  relations: [{
    type: Backbone.HasMany
    key: 'children'
    relatedModel: 'ShoppingFarm.Admin.Models.Category'
    #reverseRelation: {
    #  key: 'parent_id'
    #  includeInJSON: 'parent_id'
    #}
  }]

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
