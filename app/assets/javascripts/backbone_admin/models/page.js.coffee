class ShoppingFarm.Admin.Models.Page extends Backbone.Model
  paramRoot: 'page'
  
  constructor: (options) ->
    super(options)
   
  defaults:
    identificator: null
    title: null
    short_content: null
    full_content: null
    category_ids: null
    
  urlRoot: '/admin/pages'

class ShoppingFarm.Admin.Collections.PagesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Page
  url: '/admin/pages'
  
