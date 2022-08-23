class DucksController < ApplicationController
  before_action :set_duck, only: %i[show destroy]

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.save
      redirect_to duck_path(duck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @duck.destroy
    redirect_to duck_path(duck), status: :see_other
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :category, :description)
  end

  def set_duck
    @duck = Duck.find(params[:id])
  end
end
