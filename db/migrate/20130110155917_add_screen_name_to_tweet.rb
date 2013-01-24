class AddScreenNameToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :screen_name, :string
  end
end
