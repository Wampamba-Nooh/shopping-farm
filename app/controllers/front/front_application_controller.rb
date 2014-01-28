module Front
  
  class FrontApplicationController < ApplicationController
    protect_from_forgery with: :exception
    layout 'application'

  protected
  
    #def customer_profile
    #  @customer_profile ||= current_user.customer_profile
    #end
  
  end

end