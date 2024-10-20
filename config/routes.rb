Rails.application.routes.draw do
  resources :users do
    resources :portfolios
  end

  post '/users/new', to: 'users#create'

  resources :portfolios do
    resources :projects, only: [:index, :show, :new, :edit, :update, :destroy]
  end

  resources :projects

  post '/users/:id/portfolios/new', to: 'portfolios#create'
  post '/portfolios/:id/projects/new', to: 'projects#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'pages#home'
end
