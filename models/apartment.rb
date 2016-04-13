class Apartment < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  has_many :tenants
end
