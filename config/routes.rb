Rails.application.routes.draw do

  root 'pages#home'

  devise_scope :user do
    get '/users/edit', to: 'users/registrations#edit'
    get '/users/sign_up', to: 'users/registrations#new'
    get '/users/sign_in', to: 'users/sessions#create'
    get '/users', to: redirect('/')
  end

  post 'texts/send_text' => 'texts#send_text'


  devise_for :user
  resources :texts
end
