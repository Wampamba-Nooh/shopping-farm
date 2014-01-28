module Front 

  module Auth 
    
    class SessionsController < Devise::SessionsController
      
      def create
        self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
        sign_in(resource_name, resource)
        yield resource if block_given?

        render :json => {:success => true, csrf_param: request_forgery_protection_token,
          csrf_token: form_authenticity_token}
      end
     
      def failure
        return render :json => {:success => false, :errors => ["Ошибка авторизации"]}
      end
    end

  end

end