module Front 

  class HomeController < Front::FrontApplicationController
    protect_from_forgery with: :exception
    skip_before_filter :authenticate_user!, only: [:index]

    def index
    end

  private
    
    def browser_redirect_by_user
      if user_signed_in?
        redirect_to eval(current_user.home_path)
      else
        render 'index'
      end
    end

  end

end