class AppsController < ApplicationController
  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      redirect_to apps_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @app = App.find(params[:id])
  end

  private

  def app_params
    params.require(:app).permit(:name, :description, :votes)
  end
end
