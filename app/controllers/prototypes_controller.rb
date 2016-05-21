class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit,:show, :update]

  def index
    @prototypes = Prototype.eager_load(:user, :main_image).order("prototypes.created_at DESC")
  end

  def new
    @prototype = Prototype.new
    @prototype.thumbnails.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_url, success: 'success'
    else
      flash.now[:alert] = "failed"
      render new_prototype_path
    end
  end

  def edit
    @main = @prototype.main_image
    @sub = @prototype.sub_images
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_url, success: 'success'
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def show
    @sub_images = @prototype.thumbnails.sub
  end

  def destroy
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user_id ,thumbnails_attributes: [:image, :status, :prototype_id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end

