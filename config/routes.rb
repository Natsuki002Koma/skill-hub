Rails.application.routes.draw do
  devise_for :users
  root "skills#index"
  resources :skills, only:[:index]
end
