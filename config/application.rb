require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ShoppingFarm
  class Application < Rails::Application
    config.generators do |g|
        g.template_engine :haml
    end
    config.time_zone = 'Kyiv'
    config.active_record.default_timezone = :local
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]
    
    I18n.enforce_available_locales = false
    config.i18n.default_locale = :en

    #config.active_record.whitelist_attributes = false
    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    #config.active_record.whitelist_attributes = true
    config.assets.cache_store = :memory_store
    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.2'
    manifest_files = Dir["#{Rails.root.join('app', 'assets').to_s}/*/*_manifest.*"].map { |path| File.basename(path) }
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    
    config.assets.precompile += manifest_files
    config.assets.compress = true
    config.assets.compile = true

  end
end
