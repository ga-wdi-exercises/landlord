require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


Apartment.destroy_all
Tenant.destroy_all


apartment_101 = Apartment.create(address: "123 Main St Apt 101", monthly_rent: 2000, sqft: 2500, num_beds: 4, num_baths: 2)
apartment_102 = Apartment.create(address: "123 Main St Apt 102", monthly_rent: 2000, sqft: 2500, num_beds: 4, num_baths: 2)
apartment_103 = Apartment.create(address: "123 Main St Apt 103", monthly_rent: 3000, sqft: 3750, num_beds: 5, num_baths: 3)

apartment_101.tenants.create(name: "Honest Abe", age: 190, gender: "male")
apartment_101.tenants.create(name: "G Dub", age: 65, gender: "male")
apartment_102.tenants.create(name: "Garfield", age: 65, gender: "male")
apartment_102.tenants.create(name: "Taft", age: 65, gender: "male")
apartment_103.tenants.create(name: "Hoover", age: 65, gender: "male")
apartment_103.tenants.create(name: "Carter", age: 65, gender: "male")
apartment_103.tenants.create(name: "Reagan", age: 65, gender: "male")
apartment_103.tenants.create(name: "Clinton", age: 65, gender: "male")
apartment_103.tenants.create(name: "Sanders", age: 65, gender: "male")

tenants_all = Tenant.all
tenants_apartment_101 = Tenant.where(address: "123 Main St Apt 101")
apartment_101 = Apartment.find_by(address: "123 Main St Apt 101")
apartment_101.monthly_rent = 2200
apartment_101.save
apartment_101.update(monthly_rent: 2300)
# apartment_101.destroy



binding.pry
