module ApplicationHelper
=begin
    def resource_name
      :user
    end
   
    def resource
      @resource ||= User.new
    end
   
    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
=end
  def settings
    @settings
  end

  def abs_url(uri, *args)
    options = args.extract_options!
    options[:scheme] = options.delete(:proto)
    if args[0].present? and args[0].is_a? String
      options[:host] = args[0]
    end
    begin
      uri = URI.parse(uri) if uri.is_a? String
      if request
        uri.scheme ||= request.scheme
        uri.host ||= request.host
        if Rails.env.production? && uri.scheme == 'http'
          uri.port = nil
        else
          uri.port = request.port
        end
      else
        options[:scheme] = "http" unless options[:scheme]
      end
      # force from options
      uri.scheme = options[:scheme] if options[:scheme]
      if host = options[:host]
        host, port = host.split(':')
        uri.host = host
        uri.port = port.to_i unless uri.scheme == 'http'
      end
      uri.to_s
    rescue URI::InvalidURIError
      ''
    end
  end

end
