class ProjectsController < ApplicationController
  before_action :find_portfolio, only: [:index]
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    # this is all projects that belong to the target portfolio
    @projects = @portfolio.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)

    if project.save
      redirect_to project_path project
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path project
    else
      render :edit
    end
  end

  def destroy
    portfolio = @project.portfolio
    @project.destroy

    redirect_to porfolio_path portfolio
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def find_portfolio
    @portfolio = portfolio.find(params[:portfolio_id]) 
  end
end
