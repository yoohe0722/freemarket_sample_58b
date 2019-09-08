Rails.application.routes.draw do
<<<<<<< HEAD
  root 'products#index'
  get 'products#show'
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get  'items'      =>  'items#index'
  get  'items/show'      =>  'items#show'
  get  'items/buycheck'      =>  'items#buycheck'
  get  'items/buy'      =>  'items#buy'

>>>>>>> master
end
