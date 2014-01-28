class ErrorsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def mail_js_error
    ServerErrorMailer.email_js_error(customer_proposal_params).deliver
    respond_to do |format|
      format.json { head :no_content }
    end
  end

private
  def customer_proposal_params
    params.require(:error).permit(:message)
  end
end
