NewsSystem::Application.routes.draw do
  devise_for :users

  resources :articles do
    post :like, on: :member
    post :dislike, on: :member
  end

  resources :user do
    resources :articles
  end

  root to: 'articles#index'
end
