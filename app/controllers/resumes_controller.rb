class ResumesController < ApplicationController
  
  before_filter :check_for_top_secret
  
  def check_for_top_secret
    render :text => "Not authorized", :status => 403if params[:id] && params[:id].to_i > 500
  end
  
  def viewed
   resume = Resume.find(params[:id])
   @views = resume.view_histories
  end
  
  #before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
    
    respond_to do |format|
      format.html 
      format.json { render json: @resumes }
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    @resume = Resume.find(params[:id])
    
    vh = ViewHistory.new(:time_viewed => Time.now, :ip => request.remote_ip, :resume_id => @resume.id)
    vh.save
    
    respond_to do |format|
      format.html
      format.json { render json: @resume}
    end
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
    
    respond_to do |format|
      format.html
      format.json { render json: @resume}
    end
  end

  # GET /resumes/1/edit
  def edit
    @resume = Resume.find(params[:id])
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resume }
      else
        format.html { render action: 'new' }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:name, :phone, :email, :street, :city, :state, :zip, :summary)
    end
end
