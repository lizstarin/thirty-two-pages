class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

ThirtyTwoPages::Application.routes.draw do

  root :to => "users#show"

  devise_for :users

  resources :users do
    resource :profile
    resources :friend_requests, :only => [:index, :new, :create, :update] do
      collection do
        get "refresh"
      end
    end
    resources :friendships, :only => [:new, :create, :destroy]
    resources :messages
    resources :notifications
    resources :photos
    resources :projects, :only => [:index, :show]
  end

  resources :projects, :except => [:index, :show] do
    resources :pages
    resources :images
		resources :likes
  end

  resources :pages do
    resource :caption
		resource :image
  end

  resources :posts do
    collection do
      get "refresh"
    end
    resources :comments do
      collection do
        get "refresh"
      end
    end
    resources :likes do
      collection do
        get "refresh"
      end
    end
  end

  resources :emails

	resources :user_searches, :only => [:new, :create, :show]
end
