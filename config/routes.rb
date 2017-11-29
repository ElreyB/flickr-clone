Rails.application.routes.draw do
  root :to => 'images#index'

  devise_for :users

  resources :profiles do
    resources :images
  end

  resources :profiles do
    resources :comments
  end

  resources :profiles do
    resources :favorites
  end

  resources :images do
    resources :tags
  end


end
