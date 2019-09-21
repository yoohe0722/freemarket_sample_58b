Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :create] do
    collection do
      get 'buy'
      get 'buycheck'
      get 'shipping'
      # get 'mypage'
      get 'credit'
      get 'user_edit'
      get 'signup_registration'
    end
  end
  resources :users, only: [:index, :show, :new, :edit] do
    collection do
      get 'profile'
      get 'logout'
      get 'credit'
      get 'identification'
    end
  end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'complete' # 登録完了後のページ
    end
  end

end