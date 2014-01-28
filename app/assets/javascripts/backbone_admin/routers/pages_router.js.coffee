class ShoppingFarm.Admin.Routers.PagesRouter extends Backbone.Router
  initialize: (options) ->
    @pages_collection = new ShoppingFarm.Admin.Collections.PagesCollection()

  routes:
    "pages" : "pages"
    "pages/edit/:id" : "edit"
    "pages/:id" : "show"

  show: (id) ->    
    $("#top-admin-menu").empty()
    window.ShoppingFarm.Admin.admin_menu_toggle_active('pages')

    @model = new @pages_collection.model({id: id})
    @model.fetch
      complete: =>  
        @show_view = new ShoppingFarm.Admin.Views.Pages.ShowView({model: @model})
        $("#container").html(@show_view.render().el)

  edit: (id) ->
    $("#top-admin-menu").empty()
    window.ShoppingFarm.Admin.admin_menu_toggle_active('pages')

    @model = new @pages_collection.model({id: id})
    @model.fetch(
      complete: =>  
        @edit_view = new ShoppingFarm.Admin.Views.Pages.EditView({model: @model})
        $("#container").html(@edit_view.render().el)
        CKEDITOR.replace($('#content')[0])
    )

    
  pages: ->
    $("#top-admin-menu").empty()
    window.ShoppingFarm.Admin.admin_menu_toggle_active('pages')

    @index_view = new ShoppingFarm.Admin.Views.Pages.IndexView({collection: @pages_collection})
    
    $("#container").html(@index_view.render().el)
    @pages_collection.fetch()
    