ActiveAdmin.register Tweet, {:sort_order => "created_at_desc"} do
  actions :all, :except => :new

  # Index
  index do
    selectable_column
    column :text
    column :screen_name do |tweet|
      "@#{tweet.screen_name}"
    end
    column :tweet_created_at
    column "Replied?" do |tweet|
      status_tag tweet.reply.blank? ? "No" : "Yes",  tweet.reply.blank? ? :error : :ok
    end
    column "Actions" do |tweet|
      reply_link = link_to "Reply", edit_admin_tweet_path(tweet) unless tweet.reply.present?
      view_link = link_to "View on Twitter", "https://twitter.com/#{tweet.screen_name}/status/#{tweet.tweet_id}", :target => "new"
      "#{reply_link}&nbsp;&nbsp;#{view_link}".html_safe
    end
  end

  # Edit Form
  form :partial => "form"

  # Scope
  scope :unread, :default => true do |tweets|
    tweets.where(:reply => nil)
  end
  scope :all
end
