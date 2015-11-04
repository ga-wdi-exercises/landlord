class Apartment < ActiveRecord::Base
  has_many :tenants

  # def add_tenant new_tenant
  #
  #   if renters.count < num_beds
  #     renters << new_tenant
  #   else
  #   puts "Sorry. This apartment is full."
  #   end #if-else closure
  #
  # end #add_tenant closure

end #class closure
