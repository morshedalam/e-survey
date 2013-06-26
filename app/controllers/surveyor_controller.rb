module SurveyorControllerCustomMethods
  def self.included(base)
    base.send :layout, 'surveyor_custom'
  end

  #def new
  #  @surveys = Survey.all
  #  @title = "You can take these surveys"
  #  #redirect_to surveyor_index unless surveyor_index == available_surveys_path
  #end
  #
  #def surveyor_index
  #  super # available_surveys_path
  #end
  #
  #def show
  #  super
  #end
  #
  #def indexs
  #  @response_sets = ResponseSet.all
  #end
  #
  ## Actions
  #def newss
  #  #Check available User
  #  @user = User.random
  #  redirect_to(new_manage_user_path(), :notice => "Please add a user first") and return if @user.nil?
  #
  #  #Survey and Question
  #  @survey = Survey.find_by_access_code(&:access_code)
  #  unless @survey.present? && @survey.has_questions?
  #    redirect_to(new_manage_question_path(), :notice => "Add new survey and questionnaires") and return
  #  end
  #
  #  #Creating new response set for survey
  #  @response_set = ResponseSet.create(:survey => @survey, :user => @user)
  #
  #  #Redirect to survey page
  #  redirect_to(edit_my_survey_path({:survey_code => @survey.access_code,
  #                                   :response_set_code => @response_set.access_code}))
  #end
  #
  #
  #private
  #
  #def surveyor_finishs
  #  thank_you_path()
  #end
end

class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
end
