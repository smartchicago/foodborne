class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :title
      t.string :source
      t.string :url
      t.date :published_at

      t.timestamps
    end
  end
end
