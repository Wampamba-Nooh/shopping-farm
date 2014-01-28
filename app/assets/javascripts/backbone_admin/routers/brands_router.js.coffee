class ShoppingFarm.Admin.Routers.BrandsRouter extends Backbone.Router

  initialize: (options) ->
    @brands_collection = new ShoppingFarm.Admin.Collections.BrandsCollection()
    
  routes:
    "brands" : "brands"

  brands: ->

    window.ShoppingFarm.Admin.admin_menu_toggle_active('brands')

    @brands_index_view = new ShoppingFarm.Admin.Views.Brands.IndexView({collection: @brands_collection})
    $("#container").html(@brands_index_view.render().el)
    
    @brands_collection.fetch()   