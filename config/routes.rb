Rails.application.routes.draw do
  root :to => 'images#index'

  resources :users do
    resources :images
  end

  resources :users do
    resources :comments
  end

  resources :users do
    resources :favorites
  end

  resources :images do
    resources :tags
  end

  devise_for :users

end
