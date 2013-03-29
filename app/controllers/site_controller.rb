class SiteController < ApplicationController
  def home
    @submission = Submission.new(:tweet_id => params[:tweet_id])
  end

  def submission
    @submission = Submission.new(params[:submission])
    if @submission.save
      redirect_to page_path("thanks")
    else
      render :action => "home"
    end
  end
end
