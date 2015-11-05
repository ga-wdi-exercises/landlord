class Apartment < ActiveRecord::Base
end

def initialize
  address
  monthly_rent
  sqft
  num_beds
  num_baths
  renters
end

binding.pry
