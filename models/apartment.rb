class Apartment < ActiveRecord::Base
  has_many :tenants

  def add_tenant tenant
    if self.tenants.length >= self.num_beds.to_i
      return false
    else self.tenants.length <= self.num_beds.to_i
      self.tenants << tenant
    end
  end

end
