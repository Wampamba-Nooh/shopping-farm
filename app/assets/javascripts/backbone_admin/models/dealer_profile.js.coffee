class ShoppingFarm.Admin.Models.DealerProfile extends Backbone.Model
  paramRoot: 'dealer_profile'
  
  constructor: (options) ->
    super(options)

  defaults:
    identificator: null
    city: null
    contacts: null
    person_contacts: null
    email: null
    phone_number: '+380'

  validation: 
    identificator: 
      required: true
      msg: 'необходимо ввести'
    status: 
      required: true
      msg: 'необходимо выбрать'
    city: 
      required: true
      msg: 'необходимо ввести'
    contacts: 
      required: true
      msg: 'необходимо ввести'
    person_contacts: 
      required: true
      msg: 'необходимо ввести'
    email: 
      required: true
      msg: 'необходимо ввести'
      pattern: 'email'
    phone_number: 
      required: true
      msg: 'необходимо ввести'

  urlRoot: '/admin/dealer_profiles'

class ShoppingFarm.Admin.Collections.DealerProfilesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.DealerProfile
  url: '/admin/dealer_profiles'
