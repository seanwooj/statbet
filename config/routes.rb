Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root :to => 'static#test'

  resources :bets, :only => [:new, :create]
end
