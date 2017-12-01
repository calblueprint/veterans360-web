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
      get :requests
      patch 'connect_sign_up', to: 'veterans#connect_sign_up'
    end
    collection do
      get 'get_military_branch'
    end

    # Friendships
    resources :friendships, only: [:create] do
      collection do
        patch :reject
      end
    end
  end

  resources :resources do
    member do
      get 'num_upvotes', to: 'resources#num_upvotes'
    end
    collection do
      get 'get_resource_categories', to: 'resources#get_resource_categories'
      get 'filter_resources/:categories', to: 'resources#filter_resources'
    end
  end

  resources :upvotes do
    collection do
      patch 'delete_upvote', to: 'upvotes#delete_upvote'
    end
  end

  resources :admins
  resources :partnering_organizations
  resources :resources
  resources :upvotes

  root to: 'veterans#index'
end
