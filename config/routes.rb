Rails.application.routes.draw do
  root 'pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 	 'signup'  => 'users#new'
  get 'users/texty' => 'users#texty'
  resources :users
end
