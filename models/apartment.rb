class Apartment < ActiveRecord::Base
  has_many :tenant
end
