module Front

  class BrandsController < Front::FrontApplicationController

    before_action :set_brand, only: [:show]

    def show
    end

    private
      def set_brand
        @brand = Brand.find(params[:id])
      end
  end

end