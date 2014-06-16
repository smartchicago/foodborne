class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain

  APP_DOMAIN = 'www.foodbornechicago.org'

private
  def ensure_domain
    if Rails.env.production? and request.host != APP_DOMAIN
      redirect_to "https://#{APP_DOMAIN}#{request.fullpath}", :status => 301
    end
  end
end