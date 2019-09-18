Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :create] do
    collection do
      get 'buy'
      get 'buycheck'
      get 'shipping'
      get 'mypage'
      get 'credit'
      get 'logout'
      get 'user_edit'
      get 'identification'
      get 'signup_registration'
      post 'items' => 'items#create'
    end
  end
  resources :users, only: [:index, :show, :new, :edit] do
    collection do
      get 'credit'
      get 'complete'
      get 'phone_authentication'
      get 'address_input'
    end
  end
end