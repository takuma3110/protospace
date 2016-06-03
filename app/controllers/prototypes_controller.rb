class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit,:show, :update, :destroy]

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
    @sub = @prototype.set_sub_img
  end

  def update
    if @prototype.update(update_params)
      redirect_to root_url, success: 'updating is successful'
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def show
    @sub_images = @prototype.thumbnails.sub
    @likes = @prototype.likes
    @comments = @prototype.comments
    @comment = Comment.new(prototype_id: @prototype.id)
  end

  def destroy
    @prototype.destroy
    redirect_to :root, success: "deleting is successful"

  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user_id ,thumbnails_attributes: [:image, :status, :prototype_id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def update_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user_id ,thumbnails_attributes: [:id, :image, :status, :prototype_id])
  end

end
