require_relative '../models/tenant'
require_relative '../models/apartment'

describe Apartment do
  it "can accept a tenant" do
    adam = Tenant.new("Adam", 25, "male")
    unit_1 = Apartment.new("132 Fifth St", 1300, 800, 2, 1)
    unit_1.add_tenant adam

    expect(unit_1.renters).to include(adam)
  end

  it "can't accept more tenants than bedrooms" do
    adam = Tenant.new("Adam", 25, "male")
    steve = Tenant.new("Steve", 27, "male")
    joe = Tenant.new("Joe", 25, "male")

    unit_1 = Apartment.new("132 Fifth St", 1300, 800, 2, 1)
    unit_1.add_tenant adam
    unit_1.add_tenant steve
    unit_1.add_tenant joe

    expect(unit_1.renters.length).to eq (2)
    expect(unit_1.renters).to include (adam)
    expect(unit_1.renters).to include (steve)
  end

end
