Rails.application.routes.draw do
  resources :users do
    resources :portfolios
  end

  resources :portfolios do
    resources :projects, only: [:index, :show, :new, :edit, :update, :destroy]
  end
end
