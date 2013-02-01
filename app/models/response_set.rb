class ResponseSet < ActiveRecord::Base
  include Surveyor::Models::ResponseSetMethods

  belongs_to :teacher
  belongs_to :user, :class_name => 'Student', :foreign_key => 'user_id'
end

# == Schema Information
#
# Table name: response_sets
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  survey_id    :integer
#  access_code  :string(255)
#  started_at   :datetime
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  teacher_id   :integer
#  api_id       :string(255)
#

