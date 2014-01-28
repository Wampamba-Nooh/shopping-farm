module Front

  module Auth 
    
    class RegistrationsController < Devise::RegistrationsController

      def create
        build_resource(sign_up_params)
        resource.password = Devise.friendly_token[0,10]
        resource.confirmed_at = DateTime.now
        resource.skip_confirmation!
        resource.customer!
        if resource.save
          yield resource if block_given?
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            render json: {profile_id: resource.customer_profile.id, csrf_param: request_forgery_protection_token,
          csrf_token: form_authenticity_token}
          else
            expire_data_after_sign_in!
            render json: {profile_id: resource.customer_profile.id, csrf_param: request_forgery_protection_token, csrf_token: form_authenticity_token}
          end
        else
          clean_up_passwords resource
          user = User.find_by_email(resource.email) 
          if user
            render json: { user_data: {customer_profile: {display_name: user.customer_profile.display_name } } }, status: :unprocessable_entity
          else        
            render json: resource.errors, status: :unprocessable_entity
          end
        end
      end

    end

  end

end