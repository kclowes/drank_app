Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do
    resources :collections do
      resources :wines
    end
  end

  get '/wines', to: 'wines#index'
  get '/sessions', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'users#logout'
end
