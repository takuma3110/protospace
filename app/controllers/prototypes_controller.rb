class PrototypesController < ApplicationController

  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(create_params)
    @prototype.save
    redirect_to action: :index
    end

  def show
  end

  private
  def create_params
        params.require(:prototype).permit(:title, :catch_copy, :concept, user_id: current_user.id)

  end
end

