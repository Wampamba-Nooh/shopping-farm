module Admin

  class BrandsController < Admin::AdminApplicationController

    before_action :set_brand, only: [:show, :update, :destroy]

    def index
      @brands = Brand.all
    end

    def show
    end

    def create
      @brand = Brand.new(brand_params)

      respond_to do |format|
        if @brand.save
          format.json { render action: 'show', status: :created}
        else
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @brand.update(brand_params)
          format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
          format.json { head :no_content }
        else
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @brand.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_brand
        @brand = Brand.find(params[:id])
      end

      def brand_params
        params.require(:brand).permit(:identificator)
      end
  end

end