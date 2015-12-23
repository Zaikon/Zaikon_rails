Rails.application.routes.draw do
  devise_for :users
  root to: "goods#index"
  resources :goods, only: [:index, :create, :new, :edit, :update, :destroy]
  resources :categories, only: [:index, :create, :new, :edit, :update, :destroy]
  post '/goods/num_up' => 'goods#up'
  post '/goods/num_down' => 'goods#down'

  use_doorkeeper

  namespace :api, defaluts: { format: :json } do
    devise_for :users, controllers: {
      sessions: 'api/users/sessions',
      registrations: 'api/users/registrations',
    }
    resources :categories, only: [:index]
    resources :goods, only: [:delete, :edit] do
      member do
        put 'count_up'
        put 'count_down'
      end
    end
  end
end
