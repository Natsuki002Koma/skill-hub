Rails.application.routes.draw do
  devise_for :users
  root "skills#index"
  resources :users, only: [:index]
  resources :skills, only:[:index, :new, :create, :edit, :update] do
    resources :tweets, only:[:index, :create, :destroy]
  end
  resources :projects, only:[:index, :new, :create, :edit, :update] do
    resources :messages, only:[:index, :create, :destroy]
  end
end