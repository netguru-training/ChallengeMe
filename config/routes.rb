ChallengeMe::Application.routes.draw do
  root 'tournaments#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users
  resources :tournaments do
    member do
      post 'add_teams'
      post 'start'
      post 'update_ladder'
    end
  end
  resources :teams do
    member do
      post 'add_to_team'
      post 'add_admin_role'
      post 'remove_from_team'
    end
  end
  resources :teams do
    member do
      get 'add_to_team'
      post 'add_admin_role'
      post 'remove_from_team'
    end
  end
  get '/matches/ajax_get_match', to: 'matches#ajax_get_match'
end
