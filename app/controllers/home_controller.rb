class HomeController < ApplicationController
  def index
    @portfolios = Portfolio.all
    @hashtags = Hashtag.all
  end
end
