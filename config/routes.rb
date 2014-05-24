ChallengeMe::Application.routes.draw do
  root 'tournaments#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :tournaments
  resources :teams

  #devise_scope :user do
  #  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end
end
