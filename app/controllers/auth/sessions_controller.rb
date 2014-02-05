module Auth 
  
  class SessionsController < Devise::SessionsController
        
    def create
      self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      sign_in(resource_name, resource)
      yield resource if block_given?

      render :json => {:success => true}
    end
   
    def failure
      return render :json => {:success => false, :errors => ["Login failed."]}
    end
  end

end