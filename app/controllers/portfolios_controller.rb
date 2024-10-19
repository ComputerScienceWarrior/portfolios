class PortfoliosController < ApplicationController
  before_action :find_user, only: [:index, :show, :edit, :destroy]
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = @user.portfolios
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
    @user = User.find(params[:user_id])
  end

  def create
    portfolio = Portfolio.new(portfolio_params)

    if portfolio.save!
      redirect_to user_portfolio_path(portfolio.user, portfolio)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to user_portfolio_path(@portfolio.user, @portfolio)
    else
      render :edit
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to user_path @user
  end

  private

  def find_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:name, :type, :template, :user_id)
  end
end
