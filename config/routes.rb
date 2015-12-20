Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  root to: "goods#index"
  resources :goods, only: [:index, :create, :new, :edit, :update, :destroy]
  resources :categories, only: [:index, :create, :new, :edit, :update, :destroy]
  post '/goods/num_up' => 'goods#up'
  post '/goods/num_down' => 'goods#down'

  namespace :api, defaluts: { format: :json } do
    resources :categories, only: [:index]
  end
end
