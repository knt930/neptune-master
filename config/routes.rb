Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :recipes, only: %i[index show]
    end
  end
  root to: 'home#index'
  resources :recipes, only: %i[new create]
end
