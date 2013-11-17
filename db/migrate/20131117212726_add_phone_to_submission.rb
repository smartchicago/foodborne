class AddPhoneToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :phone, :string
  end
end
