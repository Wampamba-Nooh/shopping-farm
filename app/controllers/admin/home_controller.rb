module Admin

  class HomeController < Admin::AdminApplicationController
    protect_from_forgery with: :exception

    def index
     # authorize! :display_admin_home, nil
    end

  end

end