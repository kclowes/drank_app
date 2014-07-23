Rails.application.routes.draw do
  root 'welcome#index'
  resources :collections do
    resources :wines
  end

  resources :users
  resources :password_reset

  resources :wines, only: [:index, :show]

  # get 'users/:user_id/wines/:id', to: 'wines#show'
  # get '/wines', to: 'wines#index'
  get '/sessions', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'users#logout'
  get '/about', to: 'welcome#about'
  get '/token/:id', to: 'users#edit'
  post '/token/:id', to: 'users#update'
end
