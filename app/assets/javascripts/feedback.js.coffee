$( () ->
  frm = $("form.sh-feedback-form")

  frm.on('submit', (e) => 
    e.preventDefault()
    e.stopPropagation()

    frm.validate(
      rules: 
        'feedback[name]': "required"
        'feedback[email]':
          required: true
          email: true
        'feedback[message]': "required"
      messages: 
        'feedback[name]': "Пожалуйста введите имя"
        'feedback[email]': "Пожалуйста введите email"
        'feedback[message]': "Пожалуйста укажите сообщение"
    )
    if frm.valid()
      $.ajax(
        type: frm.attr('method')
        url: frm.attr('action')
        data: frm.serialize()
        success: (data) =>
          bootbox.alert("Спасибо, Ваше сообщение было отправлено.")
          frm[0].reset()
      )

  )
)