class IssuesController < InheritedResources::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :disable_carousel

  def index
    @issues = Issue.all.order(created_at: :desc)
  end

  
  def show
  end

  # GET /portfolios/new
  def new
    @issue = Issue.new
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_path, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def issue_params
      params.require(:issue).permit(:title, :content)
    end
    def set_issue
      @issue = Issue.find(params[:id])
    end
end

