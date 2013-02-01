class Teacher < ActiveRecord::Base
  has_many :response_sets, :dependent => :destroy

  validates :first_name, :presence => true

  after_create do
    update_attribute(:joined_at, created_at)
  end

  def name
    return "#{first_name} #{last_name}".strip
  end
end
