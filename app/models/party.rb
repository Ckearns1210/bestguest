class Party < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :items
  has_many :invites
end
