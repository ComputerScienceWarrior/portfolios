Rails.application.routes.draw do
  resources :users do
    resources :portfolios
  end

  resources :portfolios do
    resources :projects, only: [:index, :show, :new, :edit, :update, :destroy]
  end

  get '/login', to: 'sessions#new'
  get '/post', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
