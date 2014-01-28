class ServerErrorMailer < ActionMailer::Base
  default :from => "Rails Cartender <rails.notifier@cartender.ua>"

  def email_error(exception_o)
    @exception_o = exception_o
    mail(:to => 'a@artt.com.ua', :subject => "Rails Cartender Error" )
  end

  def email_js_error(exception_o)
    @exception_o = exception_o
    mail(:to => 'a@artt.com.ua', :subject => "Rails Cartender Error" )
  end
end
