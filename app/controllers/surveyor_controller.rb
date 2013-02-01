module CustomSurveyMethods
  def self.included(base)
    base.send :before_filter, :determine_if_javascript_is_enabled, :only => [:update]
    base.send :before_filter, :set_response_set_and_render_context, :only => [:edit, :show]
    base.send :layout, 'surveyor_custom'
  end

  def index
    @response_sets = ResponseSet.all
  end

  # Actions
  def new
    #Survey and Question
    @survey = Survey.random
    redirect_to(new_manage_question_path(),
                :notice => "You haven't any question to rate.") and return if !(@survey.present? && @survey.has_questions?)

    #Teacher
    @teacher = Teacher.random
    redirect_to(new_manage_teacher_path(),
                :notice => "Please add a teacher to rate") and return if @teacher.nil?

    #Student
    @student = Student.random
    redirect_to(new_manage_student_path(),
                :notice => "Please add a student to take survey") and return if @student.nil?

    #Creating new response set for survey
    @response_set = ResponseSet.create(:survey => @survey, :teacher => @teacher, :user => @student)

    #Redirect to survey page
    redirect_to(edit_my_survey_path(:survey_code => @survey.access_code,
                                    :response_set_code => @response_set.access_code))
  end

  def show
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private

  def surveyor_finish
    thank_you_path()
  end
end
class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include CustomSurveyMethods
end
