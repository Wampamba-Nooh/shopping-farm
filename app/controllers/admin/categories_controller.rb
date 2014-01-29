module Admin

  class CategoriesController < Admin::AdminApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    def index
      @categories = Category.root
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
        params.require(:category).permit(:identificator, :parent_id)
      end
  end

end