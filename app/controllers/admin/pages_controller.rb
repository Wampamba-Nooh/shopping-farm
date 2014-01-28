module Admin

  class PagesController < Admin::AdminApplicationController
    before_action :set_page, only: [:show, :update, :destroy]

    def index
      @admin_pages = Page.all
    end

    def show
    end

    def create
      @admin_page = Page.new(page_params)

      respond_to do |format|
        if @admin_page.save
          format.json { render action: 'show', status: :created }
        else
          format.json { render json: @admin_page.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @admin_page.update(page_params)
          format.json { head :no_content }
        else
          format.json { render json: @admin_page.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @admin_page.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      def set_page
        @admin_page = Page.find(params[:id])
      end

      def page_params
        params.require(:page).permit(:name, :content)
      end
  end
end