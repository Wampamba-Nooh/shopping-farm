class ServerErrorMailer < ActionMailer::Base
  default :from => "Rails Shopping.Farm <rails.notifier@cartender.ua>"

  def email_error(exception_o)
    @exception_o = exception_o
    mail(:to => 'a@artt.com.ua', :subject => "Rails Shopping.Farm Error" )
  end

  def email_js_error(exception_o)
    @exception_o = exception_o
    mail(:to => 'a@artt.com.ua', :subject => "Rails Shopping.Farm Error" )
  end
end
