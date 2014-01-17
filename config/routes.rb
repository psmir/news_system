NewsSystem::Application.routes.draw do
  devise_for :users
  resources :articles
  resources :user do
    resources :articles
  end

  root to: 'articles#index'
end
