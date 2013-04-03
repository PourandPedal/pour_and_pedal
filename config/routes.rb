Pourpedal::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "logout" => "sessions#destroy", as: "logout"
  get "login" => "sessions#new", as: "login"
  get "signup" => "users#new", as: "signup"

  resources :contacts
  resources :users
  resources :sessions
  resources :locations
  resources :charges
  resources :events
  resources :confirmations
  resources :reviews
  resources :photos
  resources :password_resets

  post '/request-reservation' => 'charges#requesting', as: :request_reservation
  post '/reserve' => 'charges#new', as: :new_charge
  post '/codes' => 'confirmations#show'
  post '/redeem_code' => 'charges#redeem'
  post '/confirm_booking' => 'charges#create_with_no_balance_due'

  match 'faq', to: 'pages#faqs', as: :faq
  match 'about', to: 'pages#about', as: :about
  match 'upgrade_browser', to: 'pages#upgrade_browser', as: :upgrade_browser
  match '/ui(/:action)', controller: 'ui'

  root to: 'pages#index'

end
