ActiveAdmin.register Submission do
  actions :all, :except => [:new, :destroy,:edit]

  # Index
  index do
    selectable_column
    column :restaurant_name
    column :restaurant_address
    column :description do |s|
      s.description[0..100].gsub(/\s\w+$/, '...')
    end
    column :date_of_incident do |s|
      s.date.strftime("%B %e, %Y")
    end
    column :name do |s|
      "#{s.first_name} #{s.last_name}"
    end
    column :email
    column :in_reply_to do |s|
      tweet = Tweet.find_by_tweet_id(s.tweet_id)
      if tweet
        link_to "@#{tweet.screen_name}: #{tweet.text}", "https://twitter.com/#{tweet.screen_name}/status/#{tweet.tweet_id}", ga_trackable('Tweet', 'View on Twitter', tweet.id, :target => "new")
      else
        "-"
      end
    end
    column :submitted_on do |s|
      s.created_at.strftime("%B %e, %Y %l:%M%p")
    end
    default_actions
  end
end
