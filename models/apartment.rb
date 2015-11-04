class Apartment < ActiveRecord::Base
  attr_accessor :address
  attr_accessor :monthy_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters

  def initialize (address, monthy_rent, sqft, num_beds, num_baths)
    @address=address
    @monthy_rent=monthy_rent
    @sqft=sqft
    @num_beds=num_beds
    @num_baths=num_baths
    @renters=Array.new(renters)
  end

  def add_tenant(tenant)
    if @renters.length < @num_beds
      @renters.push(tenant)
    end
  end

  has_many :tenants
end
