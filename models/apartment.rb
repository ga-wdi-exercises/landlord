require "pry"

class Apartment < ActiveRecord::Base
  has_many :tenants

  # def add_tenant (name)
  #   if (@renters.length < @num_beds)
  #     @renters << name
  #   end
  # end
end
