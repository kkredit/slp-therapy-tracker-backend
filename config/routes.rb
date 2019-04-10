Rails.application.routes.draw do
  resources :attempts
  resources :goals
  resources :students
  resources :locations
  resources :sessions
  resources :providers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
