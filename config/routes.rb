Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :show] do
    collection do
      get 'buy'
      get 'buycheck'
      get 'shipping'
      get 'mypage'
      get 'logout'
    end
  end
end