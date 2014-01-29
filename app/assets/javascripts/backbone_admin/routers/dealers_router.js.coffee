class ShoppingFarm.Admin.Routers.DealersRouter extends Backbone.Router
  initialize: (options) ->
    @dealer_profiles_collection = new ShoppingFarm.Admin.Collections.DealerProfilesCollection()
  
  routes:
    "dealers" : "dealers"

  dealers: ->
    $("#top-admin-menu").empty()
    window.ShoppingFarm.Admin.admin_menu_toggle_active('dealers')

    @dealers_index_view = new ShoppingFarm.Admin.Views.Dealers.IndexView({collection: @dealer_profiles_collection})

    $("#container").html(@dealers_index_view.render().el)

    @dealer_profiles_collection.fetch()  