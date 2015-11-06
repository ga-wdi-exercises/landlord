class Apartment < ActiveRecord::Base
  has_many :tenants
end
