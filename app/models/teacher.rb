class Teacher < ActiveRecord::Base
  attr_accessible :department_name, :first_name, :joining_date, :last_name

  validates :first_name, :presence => true

  after_create do
    update_attribute(:joined_at, created_at)
  end

  def name
    return "#{first_name} #{last_name}".strip
  end
end
