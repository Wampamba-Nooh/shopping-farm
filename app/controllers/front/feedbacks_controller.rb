module Front

  class FeedbacksController < Front::FrontApplicationController

    def create
      @feedback = Feedback.new(feedback_params)

      respond_to do |format|
        if @feedback.save
          FeedbackMailer.send_feedback({email: "info@qpp.com.ua", feedback: @feedback}).deliver
          format.json { head :no_content }
        else
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def feedback_params
        params.require(:feedback).permit(
          :name,
          :email,
          :message
        )
      end
  end

end