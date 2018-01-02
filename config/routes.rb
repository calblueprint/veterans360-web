Rails.application.routes.draw do

  get 'subscriptions/create'

	# get 'partnering_organizations/sign_up' => 'partnering_organizations#new'
	# post 'partnering_organizations/' => 'partnering_organizations#create'

  devise_for :partnering_organizations, controllers: {
    sessions: 'partnering_organizations/sessions',
    registrations: 'partnering_organizations/registrations'
  }
  devise_for :veterans, controllers: {
    sessions: 'veterans/sessions',
    registrations: 'veterans/registrations',
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

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

    # Subscriptions
    resources :subscriptions, only: [:create]
  end

  resources :resources do
    member do
      get 'num_upvotes', to: 'resources#num_upvotes'
    end
    collection do
      get 'get_resource_categories', to: 'resources#get_resource_categories'
      get 'filter_resources/:categories', to: 'resources#filter_resources'
      get 'get_home_resources', to: 'resources#get_home_resources'
    end
  end

  resources :upvotes do
    collection do
      patch 'delete_upvote', to: 'upvotes#delete_upvote'
    end
  end

  resources :admins, only: [:index, :create]
  resources :partnering_organizations
  resources :resources
  patch 'partnering_organizations/:id/approve' => 'partnering_organizations#approve', as: 'approve_partnering_organization'
  root to: 'veterans#index'
  get 'admins/resources', to: 'admins#view_resources'
  get 'admins/applications', to: 'admins#view_applications'
  namespace :api, defaults: { format: [:json, :csv] } do
    resources :resources, only: [:index, :show] do
    end
  end
  resources :upvotes

  root to: 'static_pages#home'
end
