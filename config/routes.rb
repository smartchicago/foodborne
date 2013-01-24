Foodpoison::Application.routes.draw do
  # ActiveAdmin
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Submissions
  match "submissions", :to => "site#submission", :as => :submissions
  match "thanks", :to => "site#thanks", :as => :thanks
  match ":tweet_id", :to => "site#home"

  # Default route
  root :to => 'site#home'
end
