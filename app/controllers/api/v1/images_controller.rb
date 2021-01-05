class Api::V1::ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = current_user.images.all
  end

  def show
    if authorized?
      respond_to do |format|
        format.json { render :show }
      end
    else
      handle_unauthorized
    end
  end

  def create
    @image = current_user.images.build(image_params)
    if authorized?
      respond_to do |format|
        if @image.save
          format.json { render :show, status: :created, location: api_v1_image_path(@image) }
        else
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end
  end

  def update
  end

  def destroy
    if authorized?
      @image.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      handle_unauthorized
    end
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end

  def authorized?
    @image.user == current_user
  end

  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end
  end

  def image_params
    params.require(:image).permit(:title, :description, :picture)
  end
end
