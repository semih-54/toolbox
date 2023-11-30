class AppsController < ApplicationController
  def index
    @apps = App.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query"
      @apps = @apps.where(sql_subquery, query: "%#{params[:query]}%")
    elsif params[:category_id].present?
      @apps = @apps.where(app_categories: { category_id: params[:category_id] })
    else
      @apps = App.all
    end
    @categories = Category.all
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
