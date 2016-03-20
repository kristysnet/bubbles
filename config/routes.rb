Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :goals do
    resources :accomplishments
  end
  resources :labels

  root 'main#index'

end
