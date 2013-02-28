class TweetController < ApplicationController
  def feed
    @title = "Food Borne"
    @tweets = Tweet.order("updated_at desc").limit(10)
    @updated = @tweets.first.updated_at unless @tweets.empty?

    render :formats => :atom, :layout => false
  end
end
