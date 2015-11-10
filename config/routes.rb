Rails.application.routes.draw do
  devise_for :users
  root to: "goods#index"
  resources :goods, only: [:index, :create, :new, :edit, :update]
  post '/goods/num_up' => 'goods#up'
  post '/goods/num_down' => 'goods#down'
end
