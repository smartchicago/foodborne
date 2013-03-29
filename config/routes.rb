Foodpoison::Application.routes.draw do
  # ActiveAdmin
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Submissions
  match "submissions", :to => "site#submission", :as => :submissions
  match ":tweet_id", :to => "site#home"

  # RSS
  match 'feed/tweets', 
        :to => 'feed#tweets',
        :as => :tweet,
        :defaults => { :format => 'atom' }

  # Default route
  root :to => 'site#home'
end
