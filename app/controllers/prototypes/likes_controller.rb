class Prototypes::LikesController < ApplicationController

  before_action :set_prototype

  def create
    # @like = @prototype.likes.create(user_id: current_user.id)
    # @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype.likes.create(params.permit(:user_id))
  end

  def destroy
    # @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    # @like.destroy
    # @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype.likes.find(params[:id]).destroy
  end


  private
   def set_prototype
     @prototype  = Prototype.find(params[:prototype_id])
   end

end
