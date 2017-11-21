Rails.application.routes.draw do
  get 'upvotes/new'

  get 'upvotes/create'

  get 'upvotes/update'

  get 'upvotes/edit'

  get 'upvotes/destroy'

  get 'upvotes/index'

  get 'upvotes/show'

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

  resources :resources do
    member do
      get 'num_upvotes', to: 'resources#num_upvotes'
      get 'has_upvoted', to: 'resources#has_upvoted'
    end
  end

  resources :admins
  resources :partnering_organizations
  resources :resources

  root to: 'veterans#index'
end
