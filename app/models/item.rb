class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  validates :name, presence: true
end
