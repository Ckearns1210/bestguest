class Party < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :items

  validates :name, :presence => {:message => "Name can not be blank."}
  validates :location, :presence => {:message => "Event must have a location."}
  validates :time, :presence => {:message => "If you don't put a time, how will people know when to come?"}
  validates :date, :presence => {:message => "What day will this event be?"}
  # geocoded_by :geo_address

  # after_validation: :geocoded


end
