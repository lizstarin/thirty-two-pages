ThirtyTwoPages::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  resources :users do
    resource :profile
  end
	
	resources :user_searches, :only => [:new, :create, :show]
end
