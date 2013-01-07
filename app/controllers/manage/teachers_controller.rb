class Manage::TeachersController < ApplicationController

  def index
    load_index()
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    render_after_save('new')
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.attributes = params[:teacher]
    render_after_save('edit')
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to manage_teachers_path
  end

  private
  def render_after_save(action_on_error)
    if @teacher.save
      load_index()
    else
      render action: action_on_error
    end
  end

  def load_index()
    @teachers = Teacher.all
    render :index
  end

end
