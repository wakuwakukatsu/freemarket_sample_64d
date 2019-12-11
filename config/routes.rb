Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: :show do
    collection do
      get 'logout'
    end
  end
  resources :items, only: :show do
    member do
      get 'buy'
      post 'pay'
      get 'checkout'
    end
  end
end
