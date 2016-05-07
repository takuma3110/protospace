class UsersController < ApplicationController
  before_action :set_user, only: :edit

  def edit
  end

  def update
    flash[:success] = 'update success'
    current_user.update(update_params)
    redirect_to action: :show
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:name, :email, :member, :works, :profile, :member, :password)
  end
end
