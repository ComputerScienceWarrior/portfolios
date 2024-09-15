class PortfoliosController < ApplicationController
  before_action :find_user, only: [:index, :show, :new, :edit, :update, :destroy]
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = @user.portfolios
  end

  def show
  end

  def new
    @portfolio = @user.build.portfolios
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to user_portfolio_path(@user, @portfolio)
    else
      render :edit
    end
  end

  def destroy
    @porfolio.destroy
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
    params.require(:portfolio).permit(:name, :type, :user_id)
  end
end
