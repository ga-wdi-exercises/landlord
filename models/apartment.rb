require_relative "../models/tenant"
require "pry"

class Apartment < ActiveRecord::Base
  has_many :tenants
  attr_reader :address,:monthly_rent,:sqft,:num_beds,:num_baths,:num_baths,:renters

  # def initialize
  #   @renters = []
  #   @num_beds = 2
  #
  # end

  # def add_tenant name, age, gender
  #   unless @renters.length == @num_beds
  #     self.renters << (Tenant.new name,age,gender)
  #   end
  # end
end

# aprt = Apartment.new
# aprt.add_tenant 'bob',23,'male'

# puts aprt

binding.pry

puts "dlfhifsdf"
