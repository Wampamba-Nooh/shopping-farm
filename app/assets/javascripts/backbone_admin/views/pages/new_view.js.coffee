ShoppingFarm.Admin.Views.Pages ||= {}

class ShoppingFarm.Admin.Views.Pages.NewView extends Backbone.View
  template: JST["backbone_admin/templates/pages/new"]
  
  events: "submit #page" : "save"
  
  bindings:
    '[name=identificator]': 
      observe: 'identificator'
    '[name=title]': 
      observe: 'title'
    '[name=short_content]': 
      observe: 'short_content'
    '[name=full_content]': 
      observe: 'full_content'

  constructor: (options) ->
    super(options)
    @options = options

    @model = new @collection.model()
    
    @options.categories_collection.off('sync')
    @options.categories_collection.on('sync', @init_categories_select2)

    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set({full_content: CKEDITOR.instances['full_content'].getData()})
    @model.set({short_content: CKEDITOR.instances['short_content'].getData()})
    @model.set('category_ids', @$("#category_ids").select2('val'))

    if @model.isValid(true)
      @model.save(null,
        success: (dealer) =>
          Backbone.history.navigate('pages', true)
        error: (dealer, jqXHR) =>
          errors = JSON.parse(jqXHR.responseText)
          _.each(errors, (val, attr) =>
            Backbone.Validation.callbacks.invalid(@, attr, val, 'name')
          )
          @model.trigger('validated', false, @model, errors)
          @model.trigger('validated:invalid', @model, errors)
      )
  
  init_categories_select2: () =>
    @$("#category_ids").select2({
      data: @options.categories_collection.toJSON()
      placeholder: "Выберите категории"
      multiple: true
      width: 300
      formatResult: (item) ->
        "#{item.title}"
      formatSelection: (item) ->
        return "#{item.title}"
    })
    @$("#category_ids").select2('val', @model.get('category_ids'))

  render: =>
    $(@el).html(@template(@model.toJSON()))
    CKEDITOR.replace(@$('#full_content')[0])
    CKEDITOR.replace(@$('#short_content')[0])
    @stickit()

    return this
