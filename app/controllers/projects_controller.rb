class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :find_portfolio, only: [:index, :new]

  def index
    @projects = @portfolio.projects
  end

  def show
  end

  def new
    @project = Project.new(portfolio_id: params[:portfolio_id])
  end

  def create
    project = Project.new(project_params)

    if project.save
      redirect_to portfolio_project_path(project.portfolio, project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path @project
    else
      render :edit
    end
  end

  def destroy
    portfolio = @project.portfolio
    @project.destroy

    redirect_to user_portfolio_path(current_user, portfolio)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def find_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id]) 
  end

  def project_params
    params.require(:project).permit(:title, :caption, :description, :thumbnail_url, :portfolio_id)
  end
end
