class Apartment < ActiveRecord::Base #inherits from Active Record
  has_many :tenants
  attr_accessor :renters
  attr_reader :address, :monthly_rent, :sqft, :numb_beds, :num_baths

  # I think I'm OK with commenting this initialize method out since I have ActiveRecord going?

  # def initialize(address)
  #   @address = apt_address
  #   @monthly_rent = rent
  #   @sqft = sqft
  #   @numb_beds = beds
  #   @num_baths = baths
  #   @renters = renters
  # end

  # This follwing def breaks Sinatra for some reason.

  # def add_tenant
  #   if renters > 0
  #     puts "There is already someone in this room."
  #   else
  #     Tenant.new  # create new person
  #     puts "Tenant added."
  # end
end
