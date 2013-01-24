class Submission < ActiveRecord::Base
  # Attributes
  attr_accessible :restaurant_name, :restaurant_address, :description, :date,
                  :first_name, :last_name, :twitter_handle, :email, :tweet_id

  # Validation
  validates :restaurant_name, :restaurant_address, :description, :date,
            :first_name, :last_name, :email,
            :presence => true

  # Callbacks
  after_create :create_service_request

  private
    # Create an Open311 service request
    def create_service_request

    end
end
