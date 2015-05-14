Rails.application.routes.draw do
  root 'events#index'
  get 'signup' => 'users#new'
  resources :events
  resources :users
end
