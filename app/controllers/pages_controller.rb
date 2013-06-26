class PagesController < ApplicationController

  def survey_results
    @response_sets = ResponseSet.completed
  end

end
