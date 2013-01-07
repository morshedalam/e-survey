jQuery ($) ->
  $("#question_survey_section_id").live "change", ->
    control_element = $(this).closest('form').find('#new_section')
    if $(this).val() is ""
      $(control_element).show()
    else
      $(control_element).hide()