class ApplicationBaseController < ActionController::Base
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!
  
  rescue_from Exception, :with => :handle_server_error
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  def handle_server_error(exception)
    if Rails.env.to_sym == :development
      raise exception
    else
      ServerErrorMailer.email_error(exception).deliver
      raise exception
      #redirect_to root_path
    end
  end
  
end
