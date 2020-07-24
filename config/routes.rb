Rails.application.routes.draw do
  root 'page#_home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  get '/upload', to: 'images#new'
  resources :images, only: [:index,:show,:create]

  get '/@:username', to: 'users#show', as: :profile
end
