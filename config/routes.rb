Rails.application.routes.draw do
  root 'events#index'
  get 'signup' => 'users#new'
  resources :users 
  resources :events
end
