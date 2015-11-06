class Apartment < ActiveRecord::Base
  has_many :tenants
  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters


  def add_tenant=(tenant)
    @renters << tenant
  end
end
