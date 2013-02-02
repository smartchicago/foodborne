namespace :fetch do

  # Fetch tweets from the test account
  task :twitter => :environment do
    Twitter.user_timeline("foodpoisonuser").each do |tweet|
      Tweet.create(
        :tweet_id => tweet.id,
        :screen_name => tweet.user.screen_name,
        :text => tweet.text
      )
    end
  end

  # Fetch from the tweet classifier
  task :classifier => :environment do

  end
end