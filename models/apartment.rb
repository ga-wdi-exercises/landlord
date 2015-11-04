#initializing class 'Apartment'
  class Apartment < ActiveRecord::Base
    has_many :tenants
  end




  # attr_accessor :addres, :monthy_rent, :sqft, :num_beds, :renters
  #   def initialize (address, monthy_rent, sqft, num_beds, num_baths, renters)
  #     @address = address
  #     @monthy_rent = monthy_rent
  #     @sqft = sqft
  #     @num_beds = num_beds
  #     @renters = renters
  #   end
  #   # instance method to add new tenants to apartment
  #   def add_tenant (person)
  #     if renters.length <= num_beds
  #       @renters << person
  #     end
  #   end
