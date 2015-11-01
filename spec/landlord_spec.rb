require_relative '../models/tenant'
require_relative '../models/apartment'

describe Apartment do
  it "can accept a tenant" do
    adam = Tenant.new("Adam", 25, "male")
    unit_5 = Apartment.new("132 Fifth St", 1300, 800, 2, 1)
    unit_5.add_tenant adam

    expect(unit_5.renters).to include(adam)
  end

  it "can't accept more tenants than bedrooms" do
    adam = Tenant.new("Adam", 25, "male")
    steve = Tenant.new("Steve", 27, "male")
    joe = Tenant.new("Joe", 25, "male")

    unit_5 = Apartment.new("132 Fifth St", 1300, 800, 2, 1)
    unit_5.add_tenant adam
    unit_5.add_tenant steve
    unit_5.add_tenant joe

    expect(unit_5.renters.length).to eq (2)
    expect(unit_5.renters).to include (adam)
    expect(unit_5.renters).to include (steve)
  end

end
