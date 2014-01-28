module Admin

  class AdminApplicationController < ApplicationController
    protect_from_forgery with: :exception
    layout 'application_admin'

  protected
    def admin_profile
      @admin_profile ||= current_user.admin_profile
    end

  end

end