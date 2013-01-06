puts "Loading surveys..."
survey = Survey.where(:title => 'Efficiency Rating').first_or_create!
puts "...end of loading surveys!"

puts "Loading sections..."
SurveySection.where(:title => 'Basic', :survey_id => survey.id, :display_order => 1).first_or_create!
SurveySection.where(:title => 'Overall Quality', :survey_id => survey.id, :display_order => 1).first_or_create!
SurveySection.where(:title => 'Time Commitment', :survey_id => survey.id, :display_order => 1).first_or_create!
SurveySection.where(:title => 'Course lectures', :survey_id => survey.id, :display_order => 1).first_or_create!
SurveySection.where(:title => 'Course materials', :survey_id => survey.id, :display_order => 1).first_or_create!
SurveySection.where(:title => 'Others', :survey_id => survey.id, :display_order => 1).first_or_create!
puts "...end of loading sections!"