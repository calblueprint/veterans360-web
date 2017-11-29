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
    collection do
      get 'get_military_branch'
    end
  end

  resources :admins
  resources :partnering_organizations
  resources :resources
  patch 'partnering_organizations/:id/approve' => 'partnering_organizations#approve', as: 'approve_partnering_organization'
  root to: 'veterans#index'
end
