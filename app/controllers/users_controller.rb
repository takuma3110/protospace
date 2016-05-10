class UsersController < ApplicationController
  before_action :set_user, only: :edit

  def edit
  end

  def update
     flash[:success] = 'Your data was successfully updated'
    current_user.update(user_params)
     redirect_to action: :show
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :member, :works, :profile, :member, :password)
  end

end

