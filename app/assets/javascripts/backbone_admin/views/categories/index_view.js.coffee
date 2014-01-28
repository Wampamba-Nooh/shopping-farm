ShoppingFarm.Admin.Views.Categories ||= {}

class ShoppingFarm.Admin.Views.Categories.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/categories/index"]

  #events:
  #  "click .new-brand" : "new_brand"
 
  constructor: (options) ->
    super(options)
    #@collection.off('sync')
    #@collection.on('sync', @addAll)
  
  addAll: () =>
    #@$("tbody").empty()
    #@collection.each(@addOne)

  addOne: (brand) =>
    #view = new ShoppingFarm.Admin.Views.Brands.BrandView({model : brand})
    #@$("tbody").append(view.render().el)

  new_brand: (e) ->
    #e.preventDefault()
    #e.stopPropagation()

    #new_view = new ShoppingFarm.Admin.Views.Brands.NewView({collection: @collection})
    #$("#modal-body-content").html(new_view.render().el)
    #$('#admin-modal-dialog').modal('show')

  render: =>
    $(@el).html(@template())
    
    @$('.tree li:has(ul)').addClass('parent_li')
    
    @$('.tree li.parent_li > span').on('click', (e) ->
      children = $(@).parent('li.parent_li').find(' > ul > li')
      if (children.is(":visible")) 
        children.hide('fast')
        $(@).addClass('glyphicon-plus-sign').removeClass('glyphicon-minus-sign')
      else
        children.show('fast')
        $(@).addClass('glyphicon-minus-sign').removeClass('glyphicon-plus-sign')
      
      e.stopPropagation()
    )
    
    return this
