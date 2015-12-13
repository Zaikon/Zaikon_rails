Rails.application.routes.draw do
  devise_for :users
  root to: "goods#index"
  resources :goods, only: [:index, :create, :new, :edit, :update, :destroy]
  resources :categories, only: [:index, :create, :new, :edit, :update, :destroy]
  post '/goods/num_up' => 'goods#up'
  post '/goods/num_down' => 'goods#down'
end
