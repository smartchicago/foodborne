class AddTweetCreatedAtToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_created_at, :string
  end
end
