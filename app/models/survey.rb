class Survey < ActiveRecord::Base
  include Surveyor::Models::SurveyMethods

  after_save :create_section

  def has_questions?
    return false if self.sections.empty?

    self.sections.each do |section|
      return true if section.questions.any?
    end

    return false
  end

  private

  def create_section
    SurveySection.where(:title => self.title,
                        :survey_id => self.id,
                        :display_order => 1).first_or_create
  end
end

# == Schema Information
#
# Table name: surveys
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  description            :text
#  access_code            :string(255)
#  reference_identifier   :string(255)
#  data_export_identifier :string(255)
#  common_namespace       :string(255)
#  common_identifier      :string(255)
#  active_at              :datetime
#  inactive_at            :datetime
#  css_url                :string(255)
#  custom_class           :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  display_order          :integer
#  api_id                 :string(255)
#  survey_version         :integer          default(0)
#

