require 'pry'

class Apartment < ActiveRecord::Base
  has_many :tenants

  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters

  # def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
  #   @address = address
  #   @monthly_rent = monthly_rent
  #   @sqft = sqft
  #   @num_beds = num_beds
  #   @num_baths = num_baths
  #   @renters = renters
  # end

  def add_tenant(new_tenants)
    if renters < num_beds
      # binding.pry
      # need to use self.method for setter method
      self.renters = renters + new_tenants
    end
  end
end

# new_apartment = Apartment.new('1002 Bell Street', 3000, 2000, 3, 3, 1)
# new_apartment.add_tenant(2)
