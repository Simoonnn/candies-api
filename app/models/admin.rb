class Admin < ApplicationRecord
  before_save :down_email
  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z]+\.[A-Za-z]+@[A-Za-z]+\.[A-Za-z]+\z/i}
  validates :name, presence: true
  validate :name_case
  has_secure_password
  def name_case
    correct_name = self.name[0].upcase + self.name[1..self.name.length-1 ].downcase
    self.name = correct_name
  end
  def down_email
    self.email = self.email.downcase
  end
end
