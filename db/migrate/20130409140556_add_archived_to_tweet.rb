class AddArchivedToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :archived, :boolean, :default => false
  end
end
