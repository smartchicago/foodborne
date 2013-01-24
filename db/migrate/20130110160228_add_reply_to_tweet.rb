class AddReplyToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :reply, :text
  end
end
