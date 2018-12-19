class ProfilesController < InheritedResources::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :disable_carousel

  def index
    @profiles = Profile.all.order(date: :asc)
  end

  
  def show
  end

  # GET /portfolios/new
  def new
    @profile = Profile.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @Profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_path, notice: 'profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:content, :date)
    end
    def set_profile
      @profile = Profile.find(params[:id])
    end
end

