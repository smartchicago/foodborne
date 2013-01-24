class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :restaurant_name
      t.string :restaurant_address
      t.text :description
      t.date :date
      t.string :first_name
      t.string :last_name
      t.string :twitter_handle
      t.string :email
      t.string :tweet_id
      t.timestamps
    end
  end
end
