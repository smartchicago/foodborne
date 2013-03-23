class Tweet < ActiveRecord::Base
  default_scope order('created_at DESC')
  
  attr_accessible :tweet_id, :tweet_created_at, :screen_name, :text, :reply, :created_at
  validates :tweet_id, :uniqueness => true
  after_save :send_reply

  private
    def send_reply
      if self.reply_changed? and !self.reply.blank?
        Twitter.update("@#{self.screen_name} #{self.reply} http://foodborne.smartchicagoapps.org/#{self.tweet_id}", :in_reply_to_status_id => self.tweet_id)
      end
    end
end
