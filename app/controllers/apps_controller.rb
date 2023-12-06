class AppsController < ApplicationController
  def index
    @apps = App.all.order(total_votes: :desc, total_vote_g2: :desc)

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query"
      @apps = @apps.where(sql_subquery, query: "%#{params[:query]}%")
    end

    if params[:connections] == "true"
      @apps = App.recommended_by(current_user.connections)
    end

    if params[:category_id].present?
      @apps = @apps.joins(:categories).where(categories: {id: params[:category_id]})
    end


    # if params[:query].present?
    #   sql_subquery = "name ILIKE :query OR description ILIKE :query"
    #   @apps = @apps.where(sql_subquery, query: "%#{params[:query]}%")
    # elsif params[:category_id].present? && params[:connections] == "true"
    #   @apps = AppCategory.where(category_id: params[:category_id]).map(&:app)
    #   @apps = App.recommended_by(current_user.connections)
    # elsif params[:category_id].present? && params[:connections] == "false"
    #   @apps = AppCategory.where(category_id: params[:category_id]).map(&:app)
    # elsif params[:connections] == "true"
    #   @apps = App.recommended_by(current_user.connections)
    # end

    @categories = Category.all

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "apps/list", locals: {apps: @apps}, formats: [:html] }
    end
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
