class Prototypes::CommentsController < ApplicationController

before_action :set_prototype, only: :create
before_action :set_comment, only: :destroy

  def create
    @prototype.comments.create(comment_params)
  end

  def destroy
    @prototype = Prototype.find(@comment.prototype_id)
    @comment.destroy
    redirect_to @prototype, success: "deleting is successful"
  end

  private
  def set_prototype
    @prototype  = Prototype.find(params[:comment][:prototype_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :prototype_id, :text)
  end
end
