Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:create, :index, :show, :edit, :update,:destroy] do
    collection do
      get 'buy'
      get 'buycheck'
      get 'shipping'
      get 'credit'
      get 'user_edit'
      get 'signup_registration'
      get 'show_edit_delete/:id', to: 'items#show_edit_delete', as: :edit_delete
    end
  end
  resources :users, only: [:index, :show, :new, :edit] do
    collection do
      get 'profile'
      get 'logout'
      get 'credit'
      get 'identification'
      get 'mypage_ship'
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