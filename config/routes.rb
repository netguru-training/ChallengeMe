ChallengeMe::Application.routes.draw do
  root 'tournaments#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :tournaments
  resources :teams
end
