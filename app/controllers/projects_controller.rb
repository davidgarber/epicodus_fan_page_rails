class ProjectsController < ApplicationController
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

  private
    def project_params
      params.require(:project).permit(:title, :description, :url)
    end
end
