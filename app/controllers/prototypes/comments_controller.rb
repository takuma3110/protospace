class Prototypes::CommentsController < ApplicationController

before_action :set_prototype

  def create
    @prototype.comments.create(comment_params)
  end

  private
  def set_prototype
    @prototype  = Prototype.find(params[:comment][:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :prototype_id, :text)
  end
end
