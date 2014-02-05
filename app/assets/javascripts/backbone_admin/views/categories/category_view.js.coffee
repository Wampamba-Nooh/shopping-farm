ShoppingFarm.Admin.Views.Categories ||= {}

class ShoppingFarm.Admin.Views.Categories.CategoryView extends Backbone.View
  template: JST["backbone_admin/templates/categories/category"]

  tagName: "li"
    
  events:
    "click .destroy" : "destroy"
    "click .edit" : "edit"
    "click .new" : "new"

  constructor: (options) ->
    super(options)
    @model.on('sync', @render, @)   

  new: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('new', @model)

  edit: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger('edit', @model)

  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    window.ShoppingFarm.Admin.DestroyPromptDialog( => 
      @model.destroy()
      this.remove()
    )
    return false

  render_children: =>
    @model.get('children').each( (m) =>
      view = new ShoppingFarm.Admin.Views.Categories.CategoryView({model : m})
      view.on('edit', (model_) =>
        @trigger('edit', model_)
      )
      view.on('new', (model_) =>
        @trigger('new', model_)
      )
      @$("#node-#{@model.id}").append(view.render().el)
    )

    @model.get('products').each( (m) =>
      @$("#node-#{@model.id}").append("<li><span class='label label-primary'>ID:#{m.id} (#{m.get('identificator')}) #{m.get('title')}</span><a href='#products/edit/#{m.id}'>edit</a></li>") 
    )

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @render_children()
    return this
