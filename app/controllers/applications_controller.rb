require 'open-uri'
require 'json'

class ApplicationsController < ApplicationController
  before_filter :login_required

  
  
  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all
	if @current_user.is_management == "true" 
		respond_to do |format|
			format.html { redirect_to '/applications/0/0/1/manager' }
			format.json { render json: @applications }
    	end
	end
	if @current_user.is_admin == "true"
      respond_to do |format|
		format.html { redirect_to '/admin' }
		format.json { render json: @applications }
      end
   end 
	if @current_user.is_student == "true"
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @applications }
        end
    end
  end
	
  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  #def new
   # @application = Application.new
#	@user_token = @current_user.token
#	@result = JSON.parse(open("http://fmi-autentificare.herokuapp.com/users/#{@current_user.uid}.json?oauth_token=#{@current_user.token}").read)
#	logger.info("RESULT = " + @result.inspect)
#	logger.info("RESULT.GROUP_ID = " +@result["user"]["student"]["group_id"].to_s)
	#puts @result
 #   respond_to do |format|
 #     format.html # new.html.erb
 #     format.json { render json: @application }
 #   end
#  end

  def new
    @application = Application.new
	@user_token = @current_user.token
	@result = JSON.parse(open("http://fmi-autentificare.herokuapp.com/users/#{@current_user.uid}.json?oauth_token=#{@current_user.token}").read)
	logger.info("RESULT = " + @result.inspect)
	logger.info("RESULT.GROUP_ID = " +@result["user"]["student"]["group_id"].to_s)
    @scholarship_id = params[:scholarship_id]
	puts @result
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  def admin_manager
    @class_year = params[:class_year]
    @specialization = params[:specialization]
    @scholarship_id = params[:scholarship_id]

    @application = Application.find_by_scholarship_id(params[:scholarship_id])
    @applications = @application.show_manager({:class_year => params[:class_year], :specialization => params[:specialization], :scholarship_id => params[:scholarship_id]})

	logger.info("@applications.size = " + @applications.size.to_s);

    @scholarship = Scholarship.find(params[:scholarship_id])
    @user = User.last()

    logger.info("@APPLICATIONS " + @applications[3]["status"])
    puts @applications
    
    respond_to do |format|
      format.html
      format.json { render json: @applications }
    end    
  end
  
  def admin
  end


  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end
end
