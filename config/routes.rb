Rails.application.routes.draw do
  resources :serves
  resources :staffs
  resources :services
  resources :rooms
  resources :room_prices
  resources :payment_infos
  resources :hotels
  resources :checkins
  resources :buys
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
