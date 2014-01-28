Backbone.Validation.configure({forceUpdate: true})


_.extend(Backbone.Validation.callbacks, {
  valid: (view, attr, selector) ->
    el = view.$('[name=' + attr + ']')
    group = el.closest('.form-group')
    group.removeClass('has-error')
    group.find('.help-block').html('').addClass('hidden')
  
   invalid: (view, attr, error, selector) -> 
    el = view.$('[name=' + attr + ']')
    group = el.closest('.form-group')
    group.addClass('has-error')
    group.find('.help-block').html(error).removeClass('hidden')
  
})