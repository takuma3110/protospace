class Prototypes::LikesController < ApplicationController

  before_action :set_prototype

  def create
    @prototype.likes.create(params.permit(:user_id))
  end

  def destroy
    @prototype.likes.find(params[:id]).destroy
  end


  private
   def set_prototype
     @prototype  = Prototype.find(params[:prototype_id])
   end

end
