Rails.application.routes.draw do
  resources :cards do
    post 'simple_test', on: :collection
  end

  resources :users do
    member do
      put 'current_deck'
    end
  end

  resources :users, :decks, shallow: true do
    resources :cards
  end

  root 'home#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :sessions

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end
