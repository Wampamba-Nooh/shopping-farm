class ShoppingFarm.Admin.Routers.ProductsRouter extends Backbone.Router
  initialize: (options) ->
    @products_collection = new ShoppingFarm.Admin.Collections.ProductsCollection()
    @brands_collection = new ShoppingFarm.Admin.Collections.BrandsCollection()
    @categories_collection = new ShoppingFarm.Admin.Collections.CategoriesCollection()

  routes:
    "products" : "index"
    "products/new" : "new_product"
    "products/edit/:id" : "edit"
    "products/:id" : "show"

  new_product: ->
    @brands_collection.fetch(
      complete: =>
        if @brands_collection.length == 0
          bootbox.alert("Не найдено ни одного бренда. Прежде чем создавать модели Вам необходимо добавить бренд.", () ->
            Backbone.history.navigate('brands', true);
          )
        else
          new_view = new ShoppingFarm.Admin.Views.Products.NewView({brands_collection: @brands_collection, categories_collection: @categories_collection, collection: @products_collection})
          $("#container").html(new_view.render().el)
          @categories_collection.fetch()
    )

  edit: (id) ->
    product = ShoppingFarm.Admin.Models.Product.findOrCreate(id)
    if !product
      product = new ShoppingFarm.Admin.Models.Product({id : id})
    
    @brands_collection.fetch(
      complete: =>
        if @brands_collection.length == 0
          bootbox.alert("Не найдено ни одного бренда. Прежде чем создавать модели Вам необходимо добавить бренд.", () ->
            Backbone.history.navigate('brands', true);
          )
        else
          product.fetch(
            success: =>
              edit_view = new ShoppingFarm.Admin.Views.Products.EditView({brands_collection: @brands_collection, categories_collection: @categories_collection, model: product})
              $("#container").html(edit_view.render().el)
              @categories_collection.fetch()
          )
    )

  show: (id) ->

  index: ->
    window.ShoppingFarm.Admin.admin_menu_toggle_active('products')

    @brands_collection.fetch(
      complete: =>
        if @brands_collection.length == 0
          bootbox.alert("Не найдено ни одного бренда. Прежде чем создавать модели Вам необходимо добавить бренд.", () ->
            Backbone.history.navigate('brands', true);
          );
        else
          @products_index_view = new ShoppingFarm.Admin.Views.Products.IndexView({collection: @products_collection, brands_collection: @brands_collection})
          
          $("#container").html(@products_index_view.render().el)
    )
    @products_collection.fetch()
    