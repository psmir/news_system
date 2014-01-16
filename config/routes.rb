NewsSystem::Application.routes.draw do
  devise_for :users
  resources :news

  root to: 'news#index'
end
