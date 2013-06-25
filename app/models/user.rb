class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password

  validates :first_name, :email, :presence => true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => {:on => :create}

  def name
    "#{first_name} #{last_name}".strip
  end

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
