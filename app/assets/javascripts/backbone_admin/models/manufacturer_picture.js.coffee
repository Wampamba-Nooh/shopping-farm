class ShoppingFarm.Admin.Models.ManufacturerPicture extends Backbone.Model
  paramRoot: 'upload'
  
  urlRoot: '/uploads/manufacturer_picture'

class ShoppingFarm.Admin.Collections.ManufacturerPicturesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.ManufacturerPicture
  url: '/uploads/manufacturer_picture'

    
