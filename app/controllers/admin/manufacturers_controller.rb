module Admin

  class ManufacturersController < Admin::AdminApplicationController
    before_action :set_manufacturer, only: [:show, :update, :destroy, :pictures]

    def index
      @manufacturers = Manufacturer.all
    end

    def pictures
      @manufacturer_pictures = @manufacturer.manufacturer_pictures
      
      uploads_json = Jbuilder.new do |json|
        json.array! @manufacturer_pictures.collect { |upload| upload.to_builder.attributes! }
      end

      respond_to do |format|
        format.json { render json: uploads_json.target! }
      end
    end
    
    def show
    end

    def create
      @manufacturer = Manufacturer.new(manufacturer_params)

      respond_to do |format|
        if @manufacturer.save
          format.json { render action: 'show', status: :created }
        else
          format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @manufacturer.update(manufacturer_params)
          format.json { head :no_content }
        else
          format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @manufacturer.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_manufacturer
        @manufacturer = Manufacturer.find(params[:id])
      end

      def manufacturer_params
        params.require(:manufacturer).permit(
          :identificator, 
          :short_description, 
          :title, 
          :full_description,
          :category_ids => []
          )
      end
  end

end