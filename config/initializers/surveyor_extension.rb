Surveyor::Helpers::SurveyorHelperMethods.module_eval do
  def surveyor_includes
    stylesheet_link_tag('surveyor/reset',
                        'surveyor/jquery-ui-1.10.0.custom',
                        'surveyor/jquery-ui-timepicker-addon',
                        'surveyor/ui.slider.extras',
                        'surveyor/results',
                        'surveyor',
                        'custom') +
        javascript_include_tag('surveyor/jquery-1.9.0',
                               'surveyor/jquery-ui-1.10.0.custom',
                               'surveyor/jquery-ui-timepicker-addon',
                               'surveyor/jquery.selectToUISlider',
                               'surveyor/jquery.surveyor',
                               'surveyor/jquery.maskedinput')
  end
end
