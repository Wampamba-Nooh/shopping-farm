class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :update, :destroy]
  
  def index
    @uploads = resource_model.all
    
    uploads_json = Jbuilder.new do |json|
      json.array! @uploads.collect { |upload| upload.to_builder.attributes! }
    end

    respond_to do |format|
      format.json { render json: uploads_json.target! }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @upload.to_builder.target! }
    end
  end

  def create
    @upload = resource_model.new(upload_params)
    respond_to do |format|
      if @upload.save
        format.json { render json: @upload.to_builder.target!, status: :created }
      else
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.json { head :no_content }
      else
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
      
  def destroy
    @upload.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

private

  def resource_model
    Object.const_get params[:resource_model].split('_').map{|s| s.capitalize}.join('')
  end

  def set_upload
    @upload = resource_model.find(params[:id])
  end
  
  def upload_params
    params.require(:upload).permit(resource_model.permitted_attributes)
  end

end