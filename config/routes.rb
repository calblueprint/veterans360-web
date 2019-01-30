Rails.application.routes.draw do
  devise_for :partnering_organizations, controllers: {
    sessions: 'partnering_organizations/sessions',
    registrations: 'partnering_organizations/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  mount_devise_token_auth_for 'Veteran', at: 'auth', controllers: {
    sessions: 'overrides/sessions'
  }

  get 'subscriptions/create'

  resources :veterans do
    member do
      get :requests
      patch 'connect_sign_up', to: 'veterans#connect_sign_up'
      get 'get_veteran_info'
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
      get 'get_home_resources', to: 'resources#get_home_resources'
      get 'get_recent_resources', to: 'resources#get_recent_resources'
    end
  end

  resources :upvotes do
    collection do
      patch 'delete_upvote', to: 'upvotes#delete_upvote'
    end
  end

  resources :admins do
    collection do
      get 'resources'
      get 'applications'
      get 'categories'
    end
  end

  resources :partnering_organizations do
    member do
      post :generate_new_password_email
      get 'categories'
      get 'resources'
    end
    collection do
      get 'resources'
      get 'veterans'
    end
  end

  resources :categories, only: %i[create destroy index] do
    member do
      get 'get_resources', to: 'categories#get_resources_in'
    end
    collection do
      get 'vault', to: 'categories#vault_categories'
      get 'response', to: 'categories#response_categories'
    end
  end

  namespace :api, defaults: { format: %i[json csv] } do
    resources :resources, only: %i[index show] do
    end
  end

  root to: redirect('/partnering_organizations/sign_in')
end
