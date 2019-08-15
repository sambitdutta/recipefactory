Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home, only: %i[index]
  resources :recipes, only: %i[index show], format: :json
end
