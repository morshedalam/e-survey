class Student < ActiveRecord::Base
  attr_accessible :admission_at, :department_name, :first_name, :last_name

  validates :first_name, :presence => true

  after_create do
    update_attribute(:admitted_at, created_at)
  end

  def name
    return "#{first_name} #{last_name}".strip
  end
end
