module Admin

  class ProductsController < Admin::AdminApplicationController

    before_action :set_product, only: [:show, :update, :destroy, :pictures]

    def index
      @products = Product.all
    end
    
    def pictures
      @product_pictures = @product.product_pictures
      
      uploads_json = Jbuilder.new do |json|
        json.array! @product_pictures.collect { |upload| upload.to_builder.attributes! }
      end

      respond_to do |format|
        format.json { render json: uploads_json.target! }
      end
    end

    def show
    end

    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.json { render action: 'show', status: :created}
        else
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @product.update(product_params)
          format.json { head :no_content }
        else
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @product.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(
          :identificator,
          :brand_id,
          :title, 
          :short_description, 
          :full_description,
          :category_ids => []
          )
      end
  end

end