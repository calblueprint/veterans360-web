Rails.application.routes.draw do
  devise_for :veterans, controllers: {
    sessions: 'veterans/sessions',
    registrations: 'veterans/registrations',
  }
  devise_for :admins

  resources :veterans, only: [:index, :show, :update, :destroy]
  resources :admins
  resources :partnering_organizations
  resources :admins
  resources :resources

  root to: 'veterans#index'
end
