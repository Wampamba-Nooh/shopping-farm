class ShoppingFarm.Admin.Models.Brand extends Backbone.Model
  paramRoot: 'brand'

  constructor: (options) ->
    super(options)
    @brand_pictures_collection = new ShoppingFarm.Admin.Collections.BrandPicturesCollection()
  
  defaults:
    identificator: null
    short_description: null
    title: null
    full_description: null

  validation: 
    identificator: 
      required: true
      msg: 'Ошибка'

  urlRoot: '/admin/brands'

  fetch_brand_pictures: () =>
    @brand_pictures_collection.fetch(
      url: "/admin/brands/#{@.id}/pictures"
    )

  update_pictures_with_brand_id: () =>
    @brand_pictures_collection.each( (item) =>
      item.set({brand_id: @.id})
      item.save()
    )    

class ShoppingFarm.Admin.Collections.BrandsCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Brand
  url: '/admin/brands'

  select2_data: () =>
    @map( (brand) ->
      {id: brand.id, text: brand.get("identificator")}
    )

