class ShoppingFarm.Admin.Models.BrandPicture extends Backbone.Model
  paramRoot: 'upload'
  
  urlRoot: '/uploads/brand_picture'

class ShoppingFarm.Admin.Collections.BrandPicturesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.BrandPicture
  url: '/uploads/brand_picture'

    
