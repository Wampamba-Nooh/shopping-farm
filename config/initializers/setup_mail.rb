ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :port      => 587,
  :address   => "smtp.mandrillapp.com",
  :user_name => "a@artt.com.ua",
  :password  => "zc_vcwdX5Nva768RKW3Ymg"
}