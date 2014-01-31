module Front

  class CategoriesController < Front::FrontApplicationController
    before_action :set_category, only: [:show]

    def show
    end

    private
      def set_category
        @category = Category.find(params[:id])
      end
  end

end