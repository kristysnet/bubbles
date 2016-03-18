Rails.application.routes.draw do

  resources :goals do
    resources :accomplishments
  end
  resources :labels

  root 'main#index'

end
