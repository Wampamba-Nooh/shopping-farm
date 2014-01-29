module Front

  class DealerProfilesController < Front::FrontApplicationController

    before_action :set_dealer_profile, only: [:show]

    def index
      @dealer_profiles = DealerProfile.all
    end

    def show
    end

    private
      def set_dealer_profile
        @dealer_profile = DealerProfile.find(params[:id])
      end
  end

end