Rails.application.routes.draw do
  root 'products#index'
  get 'products#show'
end
