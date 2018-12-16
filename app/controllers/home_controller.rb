class HomeController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
end
