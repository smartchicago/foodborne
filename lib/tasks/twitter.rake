require "pp"

task :fetch => :environment do
  Twitter.user_timeline("foodpoisonuser").each do |tweet|
    Tweet.create(
      :tweet_id => tweet.id,
      :screen_name => tweet.user.screen_name,
      :text => tweet.text
    )
  end
end