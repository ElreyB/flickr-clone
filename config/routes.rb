Rails.application.routes.draw do
  root :to => 'images#index'

  devise_for :users

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
    resources :favorites
  end

  resources :images do
    resources :tags
  end

  resources :tags

end
