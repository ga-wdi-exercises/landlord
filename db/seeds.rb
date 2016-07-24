require_relative "./connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

apt1 = Apartment.create(address: '123 fake st', monthly_rent: 450, sqft:500, num_beds: 1, num_baths: 0)
apt2 = Apartment.create(address: '321 Drury Lane', monthly_rent: 550, sqft:700, num_beds: 1, num_baths: 1)
apt3 = Apartment.create(address: '742 Evergreen Ter', monthly_rent: 1500, sqft:1400, num_beds: 4, num_baths: 2)

lbart = Tenant.create(name: 'El barto', age: 10, gender: "Male", apartment_id: 1)
milhouse = Tenant.create(name: 'Milhouse', age: 10, gender: "Male", apartment_id: 1)
muffinman = Tenant.create(name: 'Muffinman', age: 40, gender: "Male", apartment_id: 2)
muffinwoman = Tenant.create(name: 'Muffinwoman', age: 36, gender: "Female", apartment_id: 2)
homer = Tenant.create(name: 'Homer', age: 38, gender: "Male", apartment_id: 3)
marge = Tenant.create(name: 'Marge', age: 35, gender: "Female", apartment_id: 3)
bart = Tenant.create(name: 'Bart', age: 10, gender: "Male", apartment_id: 3)
lisa = Tenant.create(name: 'Lisa', age: 8, gender: "Female", apartment_id: 3)
maggie = Tenant.create(name: 'Maggie', age: 1, gender: "Female", apartment_id: 3)
