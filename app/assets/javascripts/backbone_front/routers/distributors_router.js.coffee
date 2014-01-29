class ShoppingFarm.Front.Routers.DistributorsRouter extends Backbone.Router

  initialize: (options) ->
    @dealer_profiles_collection = new ShoppingFarm.Front.Collections.DealerProfilesCollection()
    
  routes:
    "distributors" : "index"

  index: ->
    console.log('=======distributors=============')
    
    @distributors_index_view = new ShoppingFarm.Front.Views.Distributors.IndexView({collection: @dealer_profiles_collection})
    $("#container").html(@distributors_index_view.render().el)
    
    @dealer_profiles_collection.fetch()   
