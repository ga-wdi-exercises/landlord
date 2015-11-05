class Apartment < ActiveRecord::Base
  
  has_many :tenants

  attr_accessor :address
  attr_accessor :monthy_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters

  def add_tenant(tenant)
    if @renters.length < @num_beds
      @renters.push(tenant)
    end
  end

end
