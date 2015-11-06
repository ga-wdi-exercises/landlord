class Apartment < ActiveRecord::Base
  has_many :renters
end
