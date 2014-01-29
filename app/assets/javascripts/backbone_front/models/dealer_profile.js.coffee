class ShoppingFarm.Front.Models.DealerProfile extends Backbone.Model
  paramRoot: 'dealer_profile'
  
  constructor: (options) ->
    super(options)

  urlRoot: '/front/dealer_profiles'

class ShoppingFarm.Front.Collections.DealerProfilesCollection extends Backbone.Collection
  model: ShoppingFarm.Front.Models.DealerProfile
  url: '/front/dealer_profiles'
