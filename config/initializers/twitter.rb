Twitter.configure do |config|
  config.consumer_key = SETTINGS["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = SETTINGS["TWITTER_CONSUMER_SECRET"]
  config.oauth_token = SETTINGS["TWITTER_ACCESS_TOKEN"]
  config.oauth_token_secret = SETTINGS["TWITTER_ACCESS_SECRET"]
end