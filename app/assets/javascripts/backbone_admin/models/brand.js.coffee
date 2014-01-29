class ShoppingFarm.Admin.Models.Brand extends Backbone.Model
  paramRoot: 'brand'
  
  defaults:
    identificator: null

  validation: 
    identificator: 
      required: true
      msg: 'Ошибка'

  urlRoot: '/admin/brands'

class ShoppingFarm.Admin.Collections.BrandsCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Brand
  url: '/admin/brands'

  select2_data: () =>
    @map( (brand) ->
      {id: brand.id, text: brand.get("identificator")}
    )

