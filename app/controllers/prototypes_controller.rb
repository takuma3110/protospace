class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.order("created_at DESC")
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

  def show
    @prototype = Prototype.find(params[:id])
    @sub_images = @prototype.thumbnails.sub
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user_id ,thumbnails_attributes: [:image, :status, :prototype_id])

  end
end

