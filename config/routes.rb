Rails.application.routes.draw do
  devise_for :users
  root "skills#index"
  resources :skills, only:[:index, :new, :create, :edit, :update] do
    resources :tweets, only:[:index, :create, :destroy]
  end
end
