class Tweet < ActiveRecord::Base
  default_scope order('created_at DESC')
  
  attr_accessible :tweet_id, :tweet_created_at, :screen_name, :text, :reply
  validates :tweet_id, :uniqueness => true
  after_save :send_reply

  # Public: Sample replies
  EXAMPLE_REPLIES = [
    "Sorry to hear you're sick. We can help you by clicking on this link to file a report.",
    "Sorry to hear you're ill. The Chicago health department can help.",
    "Sorry to hear you're ill. The City can help by",
    "That doesn't sound good. Let us help you here:",
    "Where did you eat? Please let us know here:",
    "That doesn't sound good. This might help:",
    "Where did you eat? Report it!:"
  ]

  private
    def send_reply
      if self.reply_changed? and !self.reply.blank?
        Twitter.update("@#{self.screen_name} #{self.reply} http://foodborne.smartchicagoapps.org/#{self.tweet_id}?utm_source=twitter&utm_medium=tweet&utm_content=#{self.tweet_id}&utm_campaign=foodborne", :in_reply_to_status_id => self.tweet_id)
      end
    end
end
