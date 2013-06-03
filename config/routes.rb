ThirtyTwoPages::Application.routes.draw do
  root :to => "home#index"

  devise_for :users

  resources :users do
    resources :profile
  end
end
