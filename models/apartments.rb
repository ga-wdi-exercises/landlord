class Apartment < ActiveRecord::Base
  has_many :tenants
  # attr_accessor :renters, :rent
  # attr_reader :address, :sqft, :num_beds, :num_baths
  # def initialize (address,rent,sqft,num_beds,num_baths,renters)
  #   @address = address
  #   @rent = rent
  #   @sqft = sqft
  #   @num_beds = num_beds
  #   @num_baths = num_baths
  #   @renters = renters
  # end
  # def add_tenant (tenant)
  #   if @renters.length < @num_beds
  #     @renters << tenant
  #   end
  # end
end
