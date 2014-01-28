ShoppingFarm.Admin.Views.Settings ||= {}

class ShoppingFarm.Admin.Views.Settings.IndexView extends Backbone.View
  template: JST["backbone_admin/templates/settings/index"]

  events:
    "submit #settings": "save"

  bindings:
   '[name=usd_exchange_rate]': 
      observe: 'usd_exchange_rate'
      setOptions:
        validate: true
   '[name=eur_exchange_rate]': 
      observe: 'eur_exchange_rate'
      setOptions:
        validate: true
   '[name=trading_step]': 
      observe: 'trading_step'
      setOptions:
        validate: true
   '[name=feedback_email]': 
      observe: 'feedback_email'
      setOptions:
        validate: true
   '[name=financial_leasing_email]': 
      observe: 'financial_leasing_email'
      setOptions:
        validate: true
   '[name=moderator_email]': 
      observe: 'moderator_email'
      setOptions:
        validate: true

  constructor: (options) ->
    super(options)
    Backbone.Validation.bind(this)
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    if @model.isValid(true)
      @model.save(null,
        success: (settings) =>
          #Backbone.history.navigate('pages', true)
          bootbox.alert('Настройки сохранены')
        error: (dealer, jqXHR) =>
          errors = JSON.parse(jqXHR.responseText)
          _.each(errors, (val, attr) =>
            Backbone.Validation.callbacks.invalid(@, attr, val, 'name')
          )
          @model.trigger('validated', false, @model, errors)
          @model.trigger('validated:invalid', @model, errors)
      )

  render: =>
    $(@el).html(@template())
    
    @stickit()

    return this
