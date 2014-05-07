class FeedbackMailer < ActionMailer::Base
  default :from => "QPP FEEDBACK <noreply@qpp.com.ua>"
  
  def send_feedback(options)
    @feedback = options[:feedback]
    mail(:to => options[:email], :subject => "qpp site feedback" )
  end

 
end