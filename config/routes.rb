Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  root to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
