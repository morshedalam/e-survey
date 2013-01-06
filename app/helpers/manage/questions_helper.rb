module Manage::QuestionsHelper
  def display_type_buttons(form, method = :display_type)
    htm = ""
    Question.display_options.each do |opt|
      htm << form.radio_button(method.to_sym, opt.first)
      htm << label_tag(opt.last)
    end
    return htm.html_safe
  end
end