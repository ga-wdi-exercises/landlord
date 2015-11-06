require "rspec"
require "active_record"
require_relative "../config/connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

describe Apartment do
  describe "address" do
    it "is a string" do
      apartment = Apartment.new(address: "1600 Penn Ave")
      expect(apartment.address).to be_a(String)
    end
  end
  describe "#add_tenant" do
    context "when number of tenants" do
      describe "less than number of beds" do
        it "adds a tenant" do
          apartment = Apartment.create(num_beds: 3)
          2.times do
            apartment.add_tenant("bob", 20, "m")
          end
          expect(apartment.tenants.count).to eq(2)
        end
      end
      describe "equal to number of beds" do
        it "does not add a tenant" do
          apartment = Apartment.create(num_beds: 3)
          4.times do
            apartment.add_tenant("bob", 20, "m")
          end
          expect(apartment.tenants.count).to eq(3)
        end
      end
    end
  end
end
