class ErrorHandler

  mail_error: (exception, role = '') ->
    data_to_send = {
      error:
        message: "[#{role}] #{exception.message}"
    }
    $.post("/mail_js_error", data_to_send, (data) =>
      "json" 
      ).fail( ->
        alert(exception.message)
      )

window.error_handler ||= new ErrorHandler()
