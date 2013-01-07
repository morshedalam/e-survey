class Manage::StudentsController < ApplicationController

  def index
    load_index()
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])
    render_after_save('new')
  end

  def update
    @student = Student.find(params[:id])
    @student.attributes = params[:student]
    render_after_save('new')
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to manage_students_path
  end

  private
  def render_after_save(action_on_error)
    if @student.save
      load_index()
    else
      render action: action_on_error
    end
  end

  def load_index()
    @students = Student.all
    render :index
  end

end
