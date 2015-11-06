class Apartment < ActiveRecord::Base
  has_many :tenants

  def add_tenant name, age, gender
    if self.tenants.count < self.num_beds
      self.tenants.create(name: name, age: age, gender: gender)
    end
  end
end
