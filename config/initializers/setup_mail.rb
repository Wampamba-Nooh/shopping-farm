ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "artt.com.ua",
  :user_name            => "a@artt.com.ua",
  :password             => "k9tnkfqt",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
