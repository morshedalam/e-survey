module CustomSurveyMethods
  def self.included(base)
    base.send :before_filter, :determine_if_javascript_is_enabled, :only => [:update]
    base.send :before_filter, :set_response_set_and_render_context, :only => [:edit, :show]
    base.send :layout, 'surveyor_custom'
  end

  def index
    @response_sets = ResponseSet.all
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
