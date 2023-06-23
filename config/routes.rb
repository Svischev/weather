# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  namespace :weather do
    resource :search, only: [:show]
  end

  namespace :admin do
    resource :cities, only: %i[new create]
  end
end
