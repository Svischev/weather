Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"

  namespace :weather do
    resource :search, only: [:show]
  end

  namespace :admin do
    resource :cities, only: [:new, :create]
  end
end
