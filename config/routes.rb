Pourpedal::Application.routes.draw do

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "signup" => "users#new", as: "signup"

  resources :users
  resources :sessions

  match '/ui(/:action)', controller: 'ui'

  root to: 'pages#index'

end
