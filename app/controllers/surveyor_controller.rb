module SurveyorControllerCustomMethods
  def self.included(base)
    base.send :layout, 'surveyor_custom'
  end

  def create
    #Check available User
    @user = User.random
    redirect_to(new_manage_user_path(), :notice => "Please add a user first") and return if @user.nil?

    #Survey and Question
    @survey = Survey.find_by_access_code(params[:survey_code])
    @response_set = ResponseSet.create(:survey => @survey, :user_id => @user.id)

    if (@survey && @response_set)
      redirect_to(surveyor.edit_my_survey_path(:survey_code => @survey.access_code,
                                               :response_set_code => @response_set.access_code))
    else
      flash[:notice] = 'Unable to find survey'
      redirect_to new_manage_question_path()
    end
  end

  def export
    redirect_to manage_surveys_path()
  end

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
