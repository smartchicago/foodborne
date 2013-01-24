require "pp"

class Tweet < ActiveRecord::Base
  attr_accessible :tweet_id, :screen_name, :text, :reply
  validates :tweet_id, :uniqueness => true
  after_save :send_reply

  private
    def send_reply
      if self.reply_changed? and !self.reply.blank?
        Twitter.update("@#{self.screen_name} #{self.reply} http://food-poison-us-rails.herokuapp.com/#{self.tweet_id}", :in_reply_to_status_id => self.tweet_id)
      end
    end
end
