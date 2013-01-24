require "pp"

class SiteController < ApplicationController
  def home
    @submission = Submission.new(:tweet_id => params[:tweet_id])
  end

  def submission
    @submission = Submission.new(params[:submission])
    if @submission.save
      redirect_to :thanks
    else
      render :action => "home"
    end
  end

  def thanks
  end
end
