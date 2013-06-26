class PagesController < ApplicationController

  def survey_results
    @response_sets = ResponseSet.completed
  end

  def db_populate
    message = "You have reached data population limit"
    redirect_to('/surveys', :alert => message) and return if Survey.count > 35

    if system("rake db:populate")
      message = "Data populated successfully"
    else
      message = "Error to populate fake data, please try again"
    end

    redirect_to('/surveys', :notice => message) and return
  end

end
