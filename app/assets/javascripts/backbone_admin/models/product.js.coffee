class ShoppingFarm.Admin.Models.Product extends Backbone.RelationalModel
  paramRoot: 'product'
  
  constructor: (options) ->
    super(options)
    @product_pictures_collection = new ShoppingFarm.Admin.Collections.ProductPicturesCollection()
    
  defaults:
    identificator: null
    brand_id: null
    short_description: null
    title: null
    full_description: null
    category_ids: null
    
  validation: 
    identificator: 
      required: true
      msg: 'Ошибка'
    brand_id: 
      required: true
      msg: 'необходимо выбрать'

  urlRoot: '/admin/products'

  fetch_product_pictures: () =>
    @product_pictures_collection.fetch(
      url: "/admin/products/#{@.id}/pictures"
    )

  update_pictures_with_product_id: () =>
    @product_pictures_collection.each( (item) =>
      item.set({product_id: @.id})
      item.save()
    )    
  
  #toJSON: () ->
  #  return { 
  #    id: @.id
  #    product_name: @attributes.product_name 
  #    brand: @.brand.toJSON()
  #  }

  #save: (attributes, options) =>
  #  options = options || {}
  #  attributes = attributes || {}
  # 
  #  @.set(attributes)

  #  Backbone.Model.prototype.save.call(@, attributes, options)


class ShoppingFarm.Admin.Collections.ProductsCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.Product
  url: '/admin/products'
  
 