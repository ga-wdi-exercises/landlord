require "bundler/setup"
require "active_record"

require "pg"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all


Apartment.create(address: "1 A Street", monthly_rent: 1000, sqft: 700, num_beds: 1, num_baths: 1)
Apartment.create(address: "2 A Street", monthly_rent: 1200, sqft: 768, num_beds: 1, num_baths: 1)
Apartment.create(address: "3 A Street", monthly_rent: 2000, sqft: 1200, num_beds: 2, num_baths: 1)
Apartment.create(address: "4 A Street", monthly_rent: 2400, sqft: 1300, num_beds: 2, num_baths: 1)
Apartment.create(address: "5 A Street", monthly_rent: 2600, sqft: 1350, num_beds: 2, num_baths: 2)
Apartment.create(address: "6 A Street", monthly_rent: 850, sqft: 400, num_beds: 1, num_baths: 1)
Apartment.create(address: "7 A Street", monthly_rent: 3200, sqft: 1450, num_beds: 3, num_baths: 2)
Apartment.create(address: "8 A Street", monthly_rent: 1000, sqft: 700, num_beds: 1, num_baths: 1)
Apartment.create(address: "9 A Street", monthly_rent: 1000, sqft: 700, num_beds: 1, num_baths: 1)
Tenant.create(name: "Joe", Age: 35, Gender: "Male")
Tenant.create(name: "Karen", Age: 28, Gender: "Female")
Tenant.create(name: "Bryce", Age: 28, Gender: "Male")
Tenant.create(name: "Yuna", Age: 26, Gender: "Female")
Tenant.create(name: "Dan", Age: 27, Gender: "Male")
Tenant.create(name: "Rick", Age: 31, Gender: "Male")
Tenant.create(name: "Todd", Age: 28, Gender: "Male")
Tenant.create(name: "BoJack", Age: 43, Gender: "Male")
Tenant.create(name: "Jill", Age: 29, Gender: "Female")
Tenant.create(name: "Ann", Age: 36, Gender: "Female")
Tenant.all
all_tenants = Tenant.all
at_apartment3 =  Tenant.where(apartment_id:3)
anns_bday = Tenant.find_by(name: "Ann")[0].Age = 32
anns_bday.save
Tenant.id(7).update(Age: 51)
Tenant.find_by(name: "Todd")[0].destroy

binding.pry
