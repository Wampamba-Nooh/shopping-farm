class ShoppingFarm.Admin.Routers.PagesRouter extends Backbone.Router
  initialize: (options) ->
    @pages_collection = new ShoppingFarm.Admin.Collections.PagesCollection()
    @categories_collection = new ShoppingFarm.Admin.Collections.CategoriesCollection()

  routes:
    "pages" : "pages"
    "pages/new" : "new_page"
    "pages/edit/:id" : "edit"
    "pages/:id" : "show"

  new_page: ->
    @new_view = new ShoppingFarm.Admin.Views.Pages.NewView({collection: @pages_collection, categories_collection: @categories_collection})
    $("#container").html(@new_view.render().el)
    @categories_collection.fetch()

  show: (id) ->    
    window.ShoppingFarm.Admin.admin_menu_toggle_active('pages')

    @model = new @pages_collection.model({id: id})
    @model.fetch
      complete: =>  
        @show_view = new ShoppingFarm.Admin.Views.Pages.ShowView({model: @model})
        $("#container").html(@show_view.render().el)

  edit: (id) ->
    window.ShoppingFarm.Admin.admin_menu_toggle_active('pages')

    @model = new @pages_collection.model({id: id})
    @model.fetch(
      complete: =>  
        @edit_view = new ShoppingFarm.Admin.Views.Pages.EditView({model: @model, categories_collection: @categories_collection})
        $("#container").html(@edit_view.render().el)
        @categories_collection.fetch()        
    )

    
  pages: ->
    window.ShoppingFarm.Admin.admin_menu_toggle_active('pages')

    @index_view = new ShoppingFarm.Admin.Views.Pages.IndexView({collection: @pages_collection})
    
    $("#container").html(@index_view.render().el)
    @pages_collection.fetch()
    