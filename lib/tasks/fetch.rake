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
    @last_id = Tweet.first.nil? ? "0" : Tweet.first["tweet_id"]

    # Fetch tweets that are newer than the most recent we have in our app,
    # and create new records for them.
    # Note: It's easiest for us to search by tweet_id order
    @coll.find("id_str" => {"$gt" => @last_id}, "rClass" => {"$ne" => "not a food poisoning tweet\n"}).each do |tweet|
      Tweet.create(
        :tweet_id => tweet["id_str"],
        :screen_name => tweet["from_user"],
        :text => tweet["text"].force_encoding('iso-8859-1').encode!('utf-8'),
        :tweet_created_at => tweet["created_at"]
      )
    end
  end
end