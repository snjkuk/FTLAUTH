Rails.application.routes.draw do
  resources :comments
  resources :articles
  # get 'welcome/index'
  root 'welcome#index'
 get 'search', to: 'search#search'
#   get 'auth/:provider/callback', to: 'sessions#create'
# 	# get 'auth/:provider/callback', to: 'sessions#create'
# 	# get 'auth/facbook/callback', to: 'sessions#facbook_signin'
# get 'auth/failure', to: redirect('/')
# get 'signout', to: 'sessions#destroy', as: 'signout'
  # devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
    match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
