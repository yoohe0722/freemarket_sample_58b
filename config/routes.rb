Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :create] do

    collection do
      get 'buy'
      get 'buycheck'
      get 'shipping'
      get 'credit'
      get 'user_edit'
      get 'identification'
      get 'signup_registration'
      post 'items' => 'items#create'
    end
  end
  resources :users, only: [:show, :index, :new, :edit] do
    collection do
      get 'profile'
      get 'logout'
      get 'credit'
      get 'complete'
      get 'phone_authentication'
      get 'address_input'
      get 'mypage_ship'
      
    end
  end
end