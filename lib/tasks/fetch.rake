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
    @conn = Mongo::Connection.from_uri(SETTINGS["CLASSIFIER_URI"])
    @db = @conn.db(URI.parse(SETTINGS["CLASSIFIER_URI"]).path.gsub(/^\//, ''))
    @coll = @db.collection(SETTINGS["CLASSIFIER_COLLECTION"])

    # Find the most recent tweet in our database
    @last_created_at = Tweet.first.nil? ? "1871-10-08" : Tweet.first["created_at"].utc

    # Fetch tweets that are newer than the most recent we have in our app,
    # and create new records for them.
    @coll.find(:created_at => {"$gt" => @last_created_at}).each do |tweet|
      Tweet.create(
        :tweet_id => tweet["id_str"],
        :screen_name => tweet["from_user"],
        :text => tweet["text"]
      )
    end
  end
end