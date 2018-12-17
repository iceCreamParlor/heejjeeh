class PortfoliosController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = Portfolio.all
    @hashtags = Hashtag.all
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    5.times { @portfolio.hashtags.new }
    @disable_carousel = true
  end

  # GET /portfolios/1/edit
  def edit
    @disable_carousel = true
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    # 해시태그가 기존에 존재하면 그대로 내버려두고, 없으면 해시태그를 새로 생성
    5.times do |x|
      tag = hashtag_params[:hashtags_attributes]["#{x}"]["title"]
      if tag != ""
        a = Hashtag.find_or_create_by(title: tag)
        @portfolio.hashtags << a
      end
    end

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to '/', notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to '/', notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :content, :thumbnail)
    end
    def hashtag_params
      params.require(:portfolio).permit(hashtags_attributes: [:title])
    end
end
