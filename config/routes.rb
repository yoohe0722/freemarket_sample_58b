Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get  'items'      =>  'items#index'
  get  'items/mypage'      =>  'items#mypage'
  get  'items/buycheck'      =>  'items#buycheck'
  get  'items/buy'      =>  'items#buy'

end
