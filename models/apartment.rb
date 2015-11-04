class Apartment < ActiveRecord::Base
	has_many :tenants
	  def add_tenant(person)
	    @renters << person if @renters.length < @num_beds
	  end
end