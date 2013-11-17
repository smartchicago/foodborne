require "geocoder"
require "httparty"

class Submission < ActiveRecord::Base
  # Attributes
  attr_accessible :restaurant_name, :restaurant_address, :description, :date,
                  :first_name, :last_name, :twitter_handle, :email, :phone, :tweet_id

  # Validation
  validates :restaurant_name, :restaurant_address, :description, :date,
            :first_name, :last_name, :email,
            :presence => true

  # Callbacks
  before_create :create_service_request

  private
    # Create an Open311 service request
    def create_service_request
      # Geocode the address
      lat, long = Geocoder.coordinates("#{self.restaurant_address} , Chicago, IL") 

      HTTParty.post('http://311api.cityofchicago.org/open311/v2/requests.json', :body => { 
        :api_key => SETTINGS["OPEN_311_KEY"],
        :service_code => '4fd6e4ece750840569000019',
        :attribute => {
            :PLEASESE => 'FOODPOIS',
            :WHATISTH => self.restaurant_name,
            :ONWHATDA => self.date
        },
        :address_string => self.restaurant_address,
        :description => self.description,
        :lat => lat, 
        :long => long, 
        :first_name => self.first_name,
        :last_name => self.last_name,
        :email => self.email,
        :phone => self.phone
      })
    end
end
