require 'pry'

class Apartment < ActiveRecord::Base

  has_many :tenants

  def initialize address, monthly_rent, sqft, num_beds, num_baths
    @address = address.to_s
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_tenant tenant
    if @renters.length < @num_beds
      @renters << tenant
    else puts "You're over capacity"
    end
  end

end

puts "Yay apartment"
