class User < ActiveRecord::Base
  has_and_belongs_to_many :parties
  has_many :items
  has_secure_password
  validates :username, presence: true, uniqueness: true, length: {maximum: 50}
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: { with: EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  before_save { |user| user.email = email.downcase }

end
