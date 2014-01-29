class ShoppingFarm.Admin.Models.ProductPicture extends Backbone.Model
  paramRoot: 'upload'
  
  urlRoot: '/uploads/product_picture'

class ShoppingFarm.Admin.Collections.ProductPicturesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.ProductPicture
  url: '/uploads/product_picture'

    
