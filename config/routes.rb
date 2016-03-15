Rails.application.routes.draw do

  resources :goals

  root 'main#index'

end
