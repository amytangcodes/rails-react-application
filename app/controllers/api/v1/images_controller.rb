class Api::V1::ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end
end
