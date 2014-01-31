class ShoppingFarm.Admin.Models.Manufacturer extends Backbone.Model
  paramRoot: 'manufacturer'

  constructor: (options) ->
    super(options)
    @manufacturer_pictures_collection = new ShoppingFarm.Admin.Collections.ManufacturerPicturesCollection()
  
  defaults:
    identificator: null
    short_description: null
    title: null
    full_description: null

  validation: 
    identificator: 
      required: true
      msg: 'Ошибка'

  urlRoot: '/admin/manufacturers'

  fetch_manufacturer_pictures: () =>
    @manufacturer_pictures_collection.fetch(
      url: "/admin/manufacturers/#{@.id}/pictures"
    )

  update_pictures_with_manufacturer_id: () =>
    @manufacturer_pictures_collection.each( (item) =>
      item.set({manufacturer_id: @.id})
      item.save()
    )    

class ShoppingFarm.Admin.Collections.ManufacturersCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Manufacturer
  url: '/admin/manufacturers'

  #select2_data: () =>
  #  @map( (brand) ->
  #    {id: brand.id, text: brand.get("identificator")}
  #  )

