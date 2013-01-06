class Question < ActiveRecord::Base
  include Surveyor::Models::QuestionMethods

  attr_accessor :survey_section_title, :answer_attributes

  accepts_nested_attributes_for :answers, :allow_destroy => true
  acts_as_list :order => :display_order, :column => :display_order

  validates :survey_section_id, :presence => true
  #validate :answer_attributes

  def initialize(*args)
    super(*args)
    prepare_attributes()
  end

  def self.display_options
    return {
        'dropdown' => 'Drop-down',
        'default' => 'Show Vertically',
        'inline' => 'Show Horizontally'
    }
  end

  private

  def prepare_attributes()
    self.custom_class = self.display_type == 'inline' ? 'horizontal_answer' : ''
    build_section()
    build_display_order()
    #build_answers() if self.new_record?
  end


  def build_section
    if self.survey_section_id.blank?
      survey_section = SurveySection.where(:title => self.survey_section_title).first
      if survey_section.nil? && self.survey_section_title.present?
        survey_section = SurveySection.new(
            {:title => self.survey_section_title,
             :survey_id => product.survey_id,
             :display_order => SurveySection.maximum(:display_order).to_i + 1
            })
      end
      self.survey_section = survey_section
    end
  end

  def build_display_order
    if self.new_record?
      max_order = Question.maximum(:display_order).to_i+1
      self.display_order = max_order
    end
  end

  #def build_answers
  #  min_ans_count = self.pick? ? 2 : 1
  #  while self.answers.size < min_ans_count do
  #    if self.pick?
  #      answer = Answer.new({:response_class => 'answer', :display_type => 'default'})
  #    else
  #      answer = Answer.new({:response_class => 'string'})
  #    end
  #    self.answers << answer
  #  end
  #end

  def answer_attributes()
    if self.answers.size < 2
      self.errors.add(:answers, "You must create at least two answer(s)")
    elsif self.pick == 'one'
      items = self.answers.select { |ans| ans.text.blank? || ans.text == ans.response_class }
      self.errors.add(:answers, "Please enter answers label") if items.size > 0
    end
  end
end

# == Schema Information
#
# Table name: questions
#
#  id                     :integer          not null, primary key
#  survey_section_id      :integer
#  question_group_id      :integer
#  text                   :text
#  short_text             :text
#  help_text              :text
#  pick                   :string(255)
#  reference_identifier   :string(255)
#  data_export_identifier :string(255)
#  common_namespace       :string(255)
#  common_identifier      :string(255)
#  display_order          :integer
#  display_type           :string(255)
#  is_mandatory           :boolean
#  display_width          :integer
#  custom_class           :string(255)
#  custom_renderer        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  correct_answer_id      :integer
#  api_id                 :string(255)
#

