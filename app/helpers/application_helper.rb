module ApplicationHelper
  def show_date(date, format = '%d %b %Y')
    return "" if date.nil?
    date.strftime(format)
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def surveyor_assets
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
