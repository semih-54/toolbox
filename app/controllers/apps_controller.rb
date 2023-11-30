class AppsController < ApplicationController
  def index
    @apps = App.all

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query"
      @apps = @apps.where(sql_subquery, query: "%#{params[:query]}%")
    elsif params[:category_id].present? && params[:connections] == "true"
      @apps = AppCategory.where(category_id: params[:category_id]).map(&:app)
      @apps = App.recommended_by(current_user.connections)
    elsif params[:category_id].present? && params[:connections] == "false"
      @apps = AppCategory.where(category_id: params[:category_id]).map(&:app)
    else params[:connections] == "true"
      @apps = App.recommended_by(current_user.connections)
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
