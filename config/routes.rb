Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root :to => 'static#test'

  resources :bets, :only => [:new, :create, :show] do
    collection do
      get "appropriate_bet_metrics" => "bets#appropriate_bet_metrics"
    end
  end

  resources :players, :only => [:index, :show]
  resources :teams, :only => [:show]
end
