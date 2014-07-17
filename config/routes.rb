Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do
    resources :collections do
      resources :wines
    end
  end

  resources :password_reset

  get 'users/:user_id/wines', to: 'wines#show'
  get '/wines', to: 'wines#index'
  get '/sessions', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'users#logout'
  get '/about', to: 'welcome#about'
  get '/token', to: 'token#index'
  post '/token', to: 'token#create'
  get '/token/:id', to: 'users#edit'
  post '/token/:id', to: 'users#update'
end
