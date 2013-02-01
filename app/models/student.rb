class Student < ActiveRecord::Base
  has_many :response_sets, :class_name => 'Student', :foreign_key => 'user_id'

  attr_accessible :admission_at, :first_name, :last_name

  validates :first_name, :presence => true

  after_create do
    update_attribute(:admitted_at, created_at)
  end

  def name
    return "#{first_name} #{last_name}".strip
  end
end
