class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_redirect, only: [:show]
  http_basic_authenticate_with name:      ENV["UTS_USERNAME"], 
                               password:  ENV["UTS_PASSWORD"],
                               only:    [:new, :edit, :update, :destroy]

  layout 'projects'
  
  def admin
    @projects = Project.all
  end

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    @project.students.build
  end

  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @project = Project.new(project_params)
    @project.category_id = params[:category_id]
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
         @project.category_id = params[:category_id]
         # @project.student_id = params[:student_id]
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project_redirect
      @project = Project.friendly.find(params[:id])
      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the project_path, and we should do
      # a 301 redirect that uses the current friendly id.     
      if request.path != project_path(@project)
        redirect_to @project, status: :moved_permanently
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :category_id, :students_attributes)
    end
end
