class ShoppingFarm.Admin.Models.Settings extends Backbone.Model
  paramRoot: 'settings'
  
  defaults:
    feedback_email: null
    financial_leasing_email: null
    moderator_email: null

  validation: 
    usd_exchange_rate: 
      required: true
      msg: 'Ошибка'
      pattern: 'number'      
    eur_exchange_rate: 
      required: true
      msg: 'Ошибка'
      pattern: 'number'
    trading_step: 
      required: true
      msg: 'Ошибка'
      pattern: 'number'
    feedback_email: 
      required: true
      msg: 'Ошибка'
      pattern: 'email'
    financial_leasing_email: 
      required: true
      msg: 'Ошибка'
      pattern: 'email'
    moderator_email: 
      required: true
      msg: 'Ошибка'
      pattern: 'email'

  urlRoot: '/admin/settings'
