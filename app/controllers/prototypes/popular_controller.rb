class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.eager_load(:user, :comments).order(likes_num: :DESC).page(params[:page])
    render 'prototypes/index'
  end

end
