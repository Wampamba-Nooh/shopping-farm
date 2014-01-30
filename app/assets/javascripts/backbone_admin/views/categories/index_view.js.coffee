ShoppingFarm.Admin.Views.Categories ||= {}

class ShoppingFarm.Admin.Views.Categories.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/categories/index"]

  events:
    "click .new-category" : "new_category_e"
    
  constructor: (options) ->
    super(options)
    @collection.off('sync')
    @collection.on('sync', @addAll)
  
  addAll: () =>
    @$("#tree").empty()
    @collection.each(@addOne)
    @$('.tree li:has(ul)').addClass('parent_li')
    
    @$('.tree li.parent_li > span').off('click')
    @$('.tree li.parent_li > span').on('click', (e) ->
      children = $(@).parent('li.parent_li').find(' > ul > li')
      if (children.is(":visible")) 
        children.hide('fast')
        $(@).addClass('glyphicon-plus-sign').removeClass('glyphicon-minus-sign')
      else
        children.show('fast')
        $(@).addClass('glyphicon-minus-sign').removeClass('glyphicon-plus-sign')
      #e.stopPropagation()
    )

  addOne: (category) =>
    view = new ShoppingFarm.Admin.Views.Categories.CategoryView({model : category})
    view.on('edit', (m) =>
      @edit_category(m)
    )
    view.on('new', (m) =>
      new_model = new @collection.model({parent_id: m.id})
      @new_category(new_model)
    )
    @$("#tree").append(view.render().el)

  edit_category: (m) =>
    edit_view = new ShoppingFarm.Admin.Views.Categories.EditView({model: m, collection: @collection})
    $("#modal-body-content").html(edit_view.render().el)
    $('#admin-modal-dialog').modal('show')

  new_category: (m) =>
    new_view = new ShoppingFarm.Admin.Views.Categories.NewView({model: m, collection: @collection})
    $("#modal-body-content").html(new_view.render().el)
    $('#admin-modal-dialog').modal('show')

  new_category_e: (e) =>
    e.preventDefault()
    e.stopPropagation()
    new_model = new @collection.model()
    @new_category(new_model)

  render: =>
    $(@el).html(@template())
    
    return this
