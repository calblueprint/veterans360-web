Rails.application.routes.draw do
  resources :veterans
  resources :admins
  resources :partnering_organizations
  resources :resources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
