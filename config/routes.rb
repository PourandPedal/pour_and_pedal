Pourpedal::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "signup" => "users#new", as: "signup"

  resources :users
  resources :sessions
  resources :locations
  resources :events
  resources :charges
  post '/reservations' => 'charges#new', as: :new_charge_path

  match 'faq', to: 'pages#faqs', as: :faq
  match 'about', to: 'pages#about', as: :about
  match '/ui(/:action)', controller: 'ui'

  root to: 'pages#index'

end
