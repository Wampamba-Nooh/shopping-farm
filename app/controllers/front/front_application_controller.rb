module Front
  
  class FrontApplicationController < ApplicationController
    protect_from_forgery with: :exception
    skip_before_filter :authenticate_user!
    layout 'application'

  protected
  
    #def customer_profile
    #  @customer_profile ||= current_user.customer_profile
    #end
  
  end

end