class ShoppingFarm.Admin.Routers.SettingsRouter extends Backbone.Router
  initialize: (options) ->
    @settings = new ShoppingFarm.Admin.Models.Settings()

  routes:
    "settings" : "settings"
  
  
  settings: () ->
    window.ShoppingFarm.Admin.admin_menu_toggle_active('settings')
    
    @settings.fetch
      complete: =>
        @settings_index_view = new ShoppingFarm.Admin.Views.Settings.IndexView({model: @settings})
        
        $("#container").html(@settings_index_view.render().el)
