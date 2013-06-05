class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

ThirtyTwoPages::Application.routes.draw do

  root :to => 'users#show(current_user)'

  devise_for :users

  resources :users do
    resource :profile
    resources :friend_requests, :only => [:index, :new, :create, :update]
    resources :friendships, :only => [:new, :create, :destroy]
    resources :posts
  end

	resources :user_searches, :only => [:new, :create, :show]
end
