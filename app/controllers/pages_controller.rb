class PagesController < ApplicationController

  def about
    @counts = {
      classified: Tweet.count,
      replied: Tweet.where("reply <> ''").count,
      reports: Submission.count
    }
  end

end