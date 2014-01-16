NewsSystem::Application.routes.draw do
  resources :news

  root to: 'news#index'
end
