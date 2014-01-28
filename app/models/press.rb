class Press < ActiveRecord::Base
  attr_accessible :published_at, :source, :title, :url
end
