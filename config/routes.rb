Pourpedal::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "signup" => "users#new", as: "signup"

  resources :users
  resources :sessions

  match '/ui(/:action)', controller: 'ui'

  root to: 'pages#index'

end
