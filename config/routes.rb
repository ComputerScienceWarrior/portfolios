Rails.application.routes.draw do
  resources :users do
    resources :portfolios
  end

  resources :projects
end
