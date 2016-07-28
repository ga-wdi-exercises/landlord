class Tenant < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  #creates a method that we can call on for each individual song
  belongs_to :apartment
end
