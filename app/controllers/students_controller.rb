class StudentsController < ApplicationController
  def index
    @students = Student.order(params[:sort])
    render :index
  end

  def show
    @student = Student.find(params[:id])
    @projects = Project.order(params[:sort])
    render :show
  end

  def edit
    @student = Student.find(params[:id])
    render :edit
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  # def search(searchTerm)
  #   result = Student.basic_search(searchTerm)


  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:name)
  end
end
