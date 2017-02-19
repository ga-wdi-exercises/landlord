class Apartment < ActiveRecord::Base
  has_many :tenants

  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :num_people

  def initialize (address, monthly_rent, sqft, num_beds, num_baths, num_people)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
  end

  def add_tenant (tenant_name)
  #What is this line doing????
   @renters << person if @renters.length < @num_beds

  end

end
