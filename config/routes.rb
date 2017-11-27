Rails.application.routes.draw do
	# get 'partnering_organizations/sign_up' => 'partnering_organizations#new'
	# post 'partnering_organizations/' => 'partnering_organizations#create'

  devise_for :partnering_organizations, controllers: {
    registrations: 'partnering_organizations/registrations'
  }
  devise_for :veterans, controllers: {
    sessions: 'veterans/sessions',
    registrations: 'veterans/registrations',
  }
  devise_for :admins

  resources :veterans do
    member do
      patch 'connect_sign_up', to: 'veterans#connect_sign_up'
    end
  end

  resources :admins, only: [:index, :create]
  resources :partnering_organizations
  resources :resources
  root to: 'veterans#index'
  get 'admins/view_resources', to: 'admins#view_resources'

  namespace :api, defaults: { format: [:json, :csv] } do
    resources :resources, only: [:index, :show] do
    end
  end
end
