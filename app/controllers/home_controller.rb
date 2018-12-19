class HomeController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @portfolios = Portfolio.all.order(created_at: :desc)
    @hashtags = Hashtag.all.order(created_at: :desc)
  end
end
