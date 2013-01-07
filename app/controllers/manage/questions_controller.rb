class Manage::QuestionsController < ApplicationController

  def index
    load_index()
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new()
    #@question = Question.find(params[:id]).dup if params[:id].present?
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])
    render_after_save('new')
  end

  def update
    @question = Question.find(params[:id])
    @question.attributes = params[:question]
    render_after_save('edit')
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to manage_questions_path
  end

  private
  def render_after_save(action_on_error)
    if @question.save
      load_index()
    else
      render action: action_on_error
    end
  end

  def load_index
    @questions = Question.all
    render :index
  end

end
