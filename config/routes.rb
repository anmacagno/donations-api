# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'authentication#login'
      resources :donations, except: :show
    end
  end
end
