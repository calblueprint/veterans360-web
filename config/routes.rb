Rails.application.routes.draw do
  devise_for :veterans
  devise_for :admins
  resources :veterans
  resources :admins
  resources :partnering_organizations
  resources :admins
  resources :resources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'veterans#index'
end
