class Apartment < ActiveRecord::Base
  has_many :tenants

  # attr_reader :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters
  #
  # def initialize(address, monthly_rent, sqft, num_beds, num_baths)
  #   @address = address
  #   @monthly_rent = monthly_rent
  #   @sqft = sqft
  #   @num_beds = num_beds
  #   @num_baths = num_baths
  #   @renters = []
  # end
  #
  # def add_tenant(renter)
  #   if @renters.length < @num_beds
  #     @renters << renter
  #   end
  # end
end
