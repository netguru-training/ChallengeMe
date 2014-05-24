ChallengeMe::Application.routes.draw do
  root 'tournaments#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :tournaments
  resources :teams do
    member do
      post 'add_to_team'
    end
  end
end
