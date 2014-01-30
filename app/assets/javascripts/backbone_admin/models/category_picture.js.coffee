class ShoppingFarm.Admin.Models.CategoryPicture extends Backbone.Model
  paramRoot: 'upload'
  
  urlRoot: '/uploads/category_picture'

class ShoppingFarm.Admin.Collections.CategoryPicturesCollection extends Backbone.Collection
  model: ShoppingFarm.Admin.Models.CategoryPicture
  url: '/uploads/category_picture'
