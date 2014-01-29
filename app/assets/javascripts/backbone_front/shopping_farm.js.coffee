#= require_self
#= require hamlcoffee
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require backbone_datalink
#= require backbone_rails_sync

window.ShoppingFarm =
  Front:
    Models: {}
    Collections: {}
    Routers: {}
    Views: {}

  init_front: () ->
    window.ShoppingFarm.Front.Routers.DistributorsRouter = new ShoppingFarm.Front.Routers.DistributorsRouter()
    Backbone.history.start()
    
    
$( () ->
  window.ShoppingFarm.init_front()
)