Rails.application.routes.draw do
  root 'events#index'
  get 'signup' => 'users#new'
  get 'login'  => 'sessions#new'
  get 'new'    => 'events#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users 
  resources :events
  resources :event_attendings

end
