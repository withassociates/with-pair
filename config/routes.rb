Pair::Application.routes.draw do
  get 'ping' => 'pings#show'
  root to: 'home#show'

  resources :sessions do
    resources :bookings
  end
end
