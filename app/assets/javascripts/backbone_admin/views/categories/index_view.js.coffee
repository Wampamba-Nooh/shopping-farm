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
    
    @$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch')
    
    @$('.tree li.parent_li > span').on('click', (e) ->
      children = $(this).parent('li.parent_li').find(' > ul > li')
      if (children.is(":visible")) 
        children.hide('fast')
        $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
      else
        children.show('fast')
        $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign')
      
      e.stopPropagation()
    )
    
    return this
