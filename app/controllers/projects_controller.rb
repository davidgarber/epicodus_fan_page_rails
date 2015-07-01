class ProjectsController < ApplicationController
  def index
    @projects = Project.order(params[:sort])
    render :index
  end

  def new
    @student = Student.find(params[:student_id])
    @project = @student.projects.new
  end

  def create
    @student = Student.find(params[:student_id])
    @project = @student.projects.new(project_params)
    if @project.save
      redirect_to student_path(@project.student)
    else
      render
    end
  end

  def show
    @student = Student.find(params[:student_id])
    @project = Project.find(params[:id])
  end

  def edit
    @student = Student.find(params[:student_id])
    @project = Project.find(params[:id])
  end

  def update
    @student = Student.find(params[:student_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to section_path(@project.student)
    else
      render :edit
    end
  end

  def destroy
  @student = Student.find(params[:student_id])
  @project = Project.find(params[:id])
  @project.destroy
  redirect_to student_path(@project.student)
end

  private
    def project_params
      params.require(:project).permit(:title, :description, :url)
    end
end
