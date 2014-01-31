class ShoppingFarm.Admin.Routers.ManufacturersRouter extends Backbone.Router

  initialize: (options) ->
    @manufacturers_collection = new ShoppingFarm.Admin.Collections.ManufacturersCollection()
    @categories_collection = new ShoppingFarm.Admin.Collections.CategoriesCollection()

  routes:
    "manufacturers" : "manufacturers"

  manufacturers: ->

    window.ShoppingFarm.Admin.admin_menu_toggle_active('manufacturers')

    @manufacturers_index_view = new ShoppingFarm.Admin.Views.Manufacturers.IndexView({collection: @manufacturers_collection, categories_collection: @categories_collection})
    $("#container").html(@manufacturers_index_view.render().el)
    
    @manufacturers_collection.fetch()   
    @categories_collection.fetch()