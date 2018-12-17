class HomeController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @portfolios = Portfolio.all
    @hashtags = Hashtag.all
  end
end
