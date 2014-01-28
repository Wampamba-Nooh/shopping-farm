ShoppingFarm.Admin.Views.Dealers ||= {}

class ShoppingFarm.Admin.Views.Dealers.EditView extends Backbone.View
  template: JST["backbone_admin/templates/dealers/edit"]
  
  events: "submit #dealer" : "save"
  
  bindings:
    '[name=dealer_name]': 
       observe: 'dealer_name'
       setOptions:
         validate: true
    '[name=status]': 
       observe: 'status'
       setOptions:
         validate: true
    '[name=brand_ids]':
       observe: 'brand_ids'
       setOptions:
         validate: true
    '[name=city]': 
       observe: 'city'
       setOptions:
         validate: true
    '[name=contacts]': 
       observe: 'contacts'
       setOptions:
         validate: true
    '[name=person_contacts]': 
       observe: 'person_contacts'
       setOptions:
         validate: true
    '[name=email]':
       observe: 'email'
       setOptions:
         validate: true
    '[name=phone_number]':
       observe: 'phone_number'
       setOptions:
         validate: true
    '[name=access_concurrent_proposition]':
       observe: 'access_concurrent_proposition'

  constructor: (options) ->
    super(options)
   
    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    if @model.isValid(true)
      @model.set('brand_ids', @$("#brand_ids").select2('val'))
      @model.save(null,
        success: (dealer) =>
          @model.fetch(
            complete: =>
              @collection.trigger('reset')
          )
          $('#admin-modal-dialog').modal('hide')
        error: (dealer, jqXHR) =>
          errors = JSON.parse(jqXHR.responseText)
          _.each(errors, (val, attr) =>
            Backbone.Validation.callbacks.invalid(@, attr, val, 'name')
          )
          @model.trigger('validated', false, @model, errors)
          @model.trigger('validated:invalid', @model, errors)
      )

  init_city_autocomplete: () =>
    options = {
      types: ['(cities)']
      componentRestrictions: {country: "ua"}
    }
    autocomplete = new google.maps.places.Autocomplete(@$("#city")[0])
    google.maps.event.addListener(autocomplete, 'place_changed', () =>
      place = autocomplete.getPlace()
      @model.set({city: @$("#city").val(), city_latitude: place.geometry.location.lat(), city_longitude: place.geometry.location.lng()})
    )

  init_dealer_status_select2: () =>
    @$("#status").select2({
      data: [{id: 'not_dealer', text: 'не дилер'},{id: 'oficial', text: 'официальный'},{id: 'not_oficial', text: 'не официальный'}]
      placeholder: "Выберите статус"
      minimumResultsForSearch: -1
    })
    @$("#status").select2('val', @model.get('status'))

  init_brand_select2: () =>
    @$("#brand_ids").select2({
      data: @options.brands_collection.select2_data()
      placeholder: "Выберите бренды"
      multiple: true
    })
    @$("#brand_ids").select2('val', @model.get('brand_ids'))

  render: =>
    $(@el).html(@template())
    @init_brand_select2()
    @init_dealer_status_select2()
    @init_city_autocomplete()
    @stickit()
    return this
