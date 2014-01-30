module Admin

  class CategoriesController < Admin::AdminApplicationController
    before_action :set_category, only: [:show, :update, :destroy, :pictures]

    def index
      @categories = Category.root
    end

    def pictures
      @category_pictures = @category.category_pictures
      
      uploads_json = Jbuilder.new do |json|
        json.array! @category_pictures.collect { |upload| upload.to_builder.attributes! }
      end

      respond_to do |format|
        format.json { render json: uploads_json.target! }
      end
    end

    def show
    end

    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.json { render action: 'show', status: :created}
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @category.update(category_params)
          format.json { head :no_content }
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @category.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:identificator, :parent_id, :title)
      end
  end

end