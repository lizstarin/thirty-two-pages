ThirtyTwoPages::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  resources :users do
    resource :profile
    resources :friend_requests, :only => [:index, :new, :create, :update]
  end

	resources :user_searches, :only => [:new, :create, :show]
end
