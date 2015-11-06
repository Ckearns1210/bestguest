class User < ActiveRecord::Base
  has_and_belongs_to_many :parties
  has_many :items
  has_secure_password
end
