Rails.application.routes.draw do
  devise_for :veterans
  devise_for :admins

  resources :veterans
  resources :admins
  resources :partnering_organizations
  resources :admins
  resources :resources

  root to: 'veterans#index'
end
