class Prototypes::CommentsController < ApplicationController

before_action :set_comment, only: :destroy
before_action :set_prototype, only: [:create, :destroy]

  def create
    @prototype.comments.create(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to @prototype, success: "deleting is successful"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :prototype_id, :text)
  end
end
