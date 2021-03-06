Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "items#index"
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'logout'
    end
  end
  resources :items  do
    member do
      get 'buy'
      post 'pay'
      get 'checkout'
    end
    collection do
      get 'list'
      get 'search'
    end
  end

  resources :signup, only: [:index, :create] do
    collection do
      get 'member_info'
      get 'phone_info'
      get 'sms_confirmation'
      get 'address_info'
      get 'credit_info' # ここで、入力の全てが終了する
      get 'complete' # 登録完了後のページ
    end
  end

  resources :sell, only: [:index, :new, :create]
  resources :cards, only: [:index, :create, :new, :destroy]
  resources :imeges, only: [:new, :create]
  resources :mypages, only: [:index,:update]

  resources :categories, only:[:new] do
    collection do
      get 'set_children_category'
      get 'set_grandchild_category'
    end
  end
end
