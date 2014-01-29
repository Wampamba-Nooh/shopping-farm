class ShoppingFarm.Admin.Routers.CategoriesRouter extends Backbone.Router

  initialize: (options) ->
    @categories_collection = new ShoppingFarm.Admin.Collections.CategoriesCollection()
    
  routes:
    "categories" : "categories"

  categories: ->

    window.ShoppingFarm.Admin.admin_menu_toggle_active('categories')

    @categories_index_view = new ShoppingFarm.Admin.Views.Categories.IndexView({collection: @categories_collection})
    $("#container").html(@categories_index_view.render().el)
    
    @categories_collection.fetch()   
    console.log('=========fetching.....')
