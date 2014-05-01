Pair::Application.routes.draw do
  root to: 'home#show'

  get 'ping' => 'pings#show'

  resources :sessions, only: [] do
    resources :bookings, only: [:new, :create, :show]
  end

  namespace :admin do
    root to: 'dashboard#show'
    get 'login' => 'auth#new', as: :login
    get 'logout' => 'auth#destroy', as: :logout
    resources :sessions, only: [:create] do
      get 'destroy' => 'sessions#destroy', as: :destroy
    end
  end

  match 'auth/google_apps/callback' => 'callbacks#handle', via: [:get, :post]
end
