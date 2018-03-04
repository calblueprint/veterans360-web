Rails.application.routes.draw do

  get 'subscriptions/create'

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
      get 'get_secret_fields'
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
    end
  end

  resources :partnering_organizations do
    member do
      post :generate_new_password_email
    end
    collection do
      get 'resources'
      get 'veterans'
    end
  end

  namespace :api, defaults: { format: [:json, :csv] } do
    resources :resources, only: [:index, :show] do
     end
  end

  root to: redirect('/partnering_organizations/sign_in')
end
