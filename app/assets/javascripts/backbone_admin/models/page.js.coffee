class ShoppingFarm.Admin.Models.Page extends Backbone.Model
  paramRoot: 'page'
  
  constructor: (options) ->
    super(options)
   
  defaults:
    content: null

  validation: 
    content: 
      required: true
      msg: 'Ошибка'

  urlRoot: '/admin/pages'

class ShoppingFarm.Admin.Collections.PagesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Page
  url: '/admin/pages'
  
