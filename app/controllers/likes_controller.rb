class LikesController < ApplicationController
  before_action :set_prototype

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    @like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
  end


  private
   def set_prototype
     @prototype  = Prototype.find(params[:prototype_id])
   end
end
