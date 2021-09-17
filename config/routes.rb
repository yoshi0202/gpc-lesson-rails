Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :posts, only: ['create', 'show', 'destroy', 'update'] do
    resources :comments, only: ['create']
    resources :favorites, only: ['create']
  end
end