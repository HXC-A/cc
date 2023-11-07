Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'
  # get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  root 'welcome#index'

  resources :users do
    get :blogs, on: :member
  end
  
  resources :sessions

  resources :blogs

  # Defines the root path route ("/")
  # root "posts#index"
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
