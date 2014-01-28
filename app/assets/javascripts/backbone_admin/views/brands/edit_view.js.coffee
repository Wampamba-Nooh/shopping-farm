ShoppingFarm.Admin.Views.Brands ||= {}

class ShoppingFarm.Admin.Views.Brands.EditView extends Backbone.View
  #template : JST["backbone_manager/templates/customer_proposals/edit"]

  #events :
  #  "submit #edit-customer_proposal" : "update"

  #update : (e) ->
  #  e.preventDefault()
  #  e.stopPropagation()

  #  @model.save(null,
  #    success : (customer_proposal) =>
  #      @model = customer_proposal
  #      window.location.hash = "/#{@model.id}"
  #  )

  #render : ->
  #  $(@el).html(@template(@model.toJSON() ))

  #  this.$("form").backboneLink(@model)

  #  return this
