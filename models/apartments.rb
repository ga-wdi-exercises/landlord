class Apartment <ActiveRecord::Base
  has_many :tenants

  def add_tenant
    renters = {}
    apartment = {}
    renters.merge(apartment)
  end
end
