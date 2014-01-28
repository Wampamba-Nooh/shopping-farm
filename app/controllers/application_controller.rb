class ApplicationController < ApplicationBaseController
  protect_from_forgery with: :exception

  before_filter :setup_settings

  def setup_settings
    #@settings ||= Settings.find_by_environment(Rails.env)
  end
  
end
