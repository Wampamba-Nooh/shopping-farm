module Admin

  class DealerProfilesController < Admin::AdminApplicationController

    before_action :set_dealer_profile, only: [:show, :update, :destroy, :send_authorization]

    def index
      @dealer_profiles = DealerProfile.all
    end

    def send_authorization
      respond_to do |format|
        dealer_user = @dealer_profile.user  
        new_password = Devise.friendly_token[0,10]
        dealer_user.password = new_password
        dealer_user.save!

        AdminMailer.send_dealer_auth({email: dealer_user.email, password: new_password}).deliver

        format.json { head :no_content }
      end
    end
    
    def show
    end

    def create
      @dealer_profile = DealerProfile.new(dealer_profile_params)
      
      user = User.new({
          email: @dealer_profile.email, 
          password: Devise.friendly_token[0,10],
        }
      )
      

      respond_to do |format|
        if user.save
          user.dealer!
          @dealer_profile.user = user
          if @dealer_profile.save 
            format.json { render action: 'show', status: :created}
          else
            format.json { render json: @dealer_profile.errors, status: :unprocessable_entity }
          end
        else
          format.json { render json: user.errors, status: :unprocessable_entity }  
        end

      end
    end

    def update
      user = @dealer_profile.user
      
      respond_to do |format|
        if user.update({email: dealer_profile_params[:email]})

          if @dealer_profile.update(dealer_profile_params)
            format.json { head :no_content }
          else
            format.json { render json: @dealer_profile.errors, status: :unprocessable_entity }
          end
        
        else
          format.json { render json: user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @dealer_profile.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_dealer_profile
        @dealer_profile = DealerProfile.find(params[:id])
      end
      
      def dealer_profile_params
        params.require(:dealer_profile).permit(
          :identificator,
          :city,
          :status,
          :contacts,
          :person_contacts,
          :email,
          :phone_number,
          :city_latitude, 
          :city_longitude
        )
      end
  end

end