Rails.application.routes.draw do
	# get 'partnering_organizations/sign_up' => 'partnering_organizations#new'
	# post 'partnering_organizations/' => 'partnering_organizations#create'
  devise_for :partnering_organizations, :controllers => {registrations: 'partnering_organizations/registrations'}

  devise_for :veterans
  devise_for :admins

  resources :veterans
  resources :admins
  resources :partnering_organizations
  resources :admins
  resources :resources

  root to: 'veterans#index'
end
