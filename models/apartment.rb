class Apartment
  attr_accessor :address, :monthy_rent, :sqft, :num_beds, :num_baths, :renters

  def initialize(apt_address, apt_rent, apt_sqft, apt_beds, apt_baths, apt_renters)
    @address = apt_address
    @monthy_rent = apt_rent
    @sqft = apt_sqft
    @num_beds = apt_beds
    @num_baths = apt_baths
    @renters = apt_renters
  end

  def add_tenant
    while apt_renters <= apt_beds
      apt_renters +=1
    end
end
