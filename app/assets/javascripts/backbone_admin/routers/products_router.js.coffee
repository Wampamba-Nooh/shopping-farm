class ShoppingFarm.Admin.Routers.ProductsRouter extends Backbone.Router
  initialize: (options) ->
    @products_collection = new ShoppingFarm.Admin.Collections.ProductsCollection()
    @brands_collection = new ShoppingFarm.Admin.Collections.BrandsCollection()

  routes:
    "products" : "index"
    "products/edit/:id" : "edit"
    "products/:id" : "show"

  edit: (id) ->
    product = new @products_collection.model({id: id})
    @brands_collection.fetch(
      complete: =>
        if @brands_collection.length == 0
          bootbox.alert("Не найдено ни одного бренда. Прежде чем создавать модели Вам необходимо добавить бренд.", () ->
            Backbone.history.navigate('brands', true);
          );
        else
          product.fetch(
            complete: =>
              edit_view = new ShoppingFarm.Admin.Views.Products.EditView({brands_collection: @brands_collection, model: product, collection: @products_collection})
              $("#container").html(edit_view.render().el)
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
    