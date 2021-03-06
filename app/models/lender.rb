class Lender < ActiveRecord::Base
  has_secure_password
  has_many :histories, dependent: :destroy
  has_many :borrowers, through: :histories
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :money, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
