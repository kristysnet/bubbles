Rails.application.routes.draw do

  resources :goals
  resources :labels

  root 'main#index'

end
