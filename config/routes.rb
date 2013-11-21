Pair::Application.routes.draw do
  get 'ping' => 'pings#show'
  get '/' => 'home#show'

  resources :sessions do
    resources :bookings
  end
end
