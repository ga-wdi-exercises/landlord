class Apartment < ActiveRecord::Base

  has_many :tenants

  def add_tenant(tenant)
    if @renters.length < @num_beds
      @renters.push(tenant)
    end
  end

end
