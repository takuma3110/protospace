class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.order(likes_num: :DESC).page(params[:page]).per(8)
    render 'prototypes/index'
  end

end
