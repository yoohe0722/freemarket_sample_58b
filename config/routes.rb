Rails.application.routes.draw do
  get 'users/new'
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show] do
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
    end
  end
end