class AdminMailer < ActionMailer::Base
  default :from => "Cartender <rails.notifier@cartender.ua>"

  def send_dealer_auth(options = {})
    @user_auth = options
    mail(:to => options[:email], :subject => "Cartender" )
  end
end
