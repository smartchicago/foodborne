ActiveAdmin.register Tweet, {:sort_order => "created_at_desc"} do
  actions :all, :except => [:new, :destroy]

  # Index
  index do
    selectable_column
    column :text
    column :screen_name do |tweet|
      link_to "@#{tweet.screen_name}", "https://twitter.com/#{tweet.screen_name}", :target => "_blank"
    end
    column :tweet_created_at
    column "Replied?" do |tweet|
      status_tag tweet.reply.blank? ? "No" : "Yes",  tweet.reply.blank? ? :error : :ok
    end
    column "Actions" do |tweet|
      reply_link = link_to("Reply", edit_admin_tweet_path(tweet), ga_trackable('Tweet', 'Reply', tweet.id)) unless tweet.reply.present?
      view_link = link_to "View on Twitter", "https://twitter.com/#{tweet.screen_name}/status/#{tweet.tweet_id}", ga_trackable('Tweet', 'View on Twitter', tweet.id, :target => "new")
      "#{reply_link}&nbsp;&nbsp;#{view_link}".html_safe
    end
  end

  # Edit Form
  form :partial => "form"

  # Scope
  scope :unread, :default => true do |tweets|
    tweets.where(:reply => nil, :archived => false)
  end
  scope :replied do |tweets|
    tweets.where("reply <> ''")
  end
  scope :all

  # Batch Actions
  batch_action :archive do |selection|
    Tweet.find(selection).each do |tweet|
      tweet.archived = true
      tweet.save
    end
    flash[:notice] = 'The selected tweets are now archived.'
    redirect_to :back
  end
end