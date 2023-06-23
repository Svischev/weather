Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"

  namespace :weather do
    resource :search, only: [:show]
  end
end
