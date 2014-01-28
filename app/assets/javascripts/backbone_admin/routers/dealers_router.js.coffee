class ShoppingFarm.Admin.Routers.DealersRouter extends Backbone.Router
  initialize: (options) ->
    @brands_collection = new ShoppingFarm.Admin.Collections.BrandsCollection()
    @dealer_profiles_collection = new ShoppingFarm.Admin.Collections.DealerProfilesCollection()
  
  routes:
    "dealers" : "dealers"

  dealers: ->
    $("#top-admin-menu").empty()
    window.ShoppingFarm.Admin.admin_menu_toggle_active('dealers')
        
    @brands_collection.fetch(
      complete: =>
        if @brands_collection.length == 0
          bootbox.alert("Не найдено ни одного бренда. Прежде чем создавать дилеров Вам необходимо добавить бренд.", () ->
            Backbone.history.navigate('brands', true);
          )
        else
          @dealers_index_view = new ShoppingFarm.Admin.Views.Dealers.IndexView({collection: @dealer_profiles_collection, brands_collection: @brands_collection})
          #{collection: @brands_collection}
          $("#container").html(@dealers_index_view.render().el)
    )
    @dealer_profiles_collection.fetch()  