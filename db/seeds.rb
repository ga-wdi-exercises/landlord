require_relative '../db/connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apartment1 = Apartment.create(address: "1600 Pennsylvania Ave", monthly_rent: 12, sqft: 54900, num_beds: 54, num_baths: 35)
apartment2 = Apartment.create(address: "8 Canal St", monthly_rent: 3000, sqft: 200, num_beds: 1, num_baths: 1)
apartment3 = Apartment.create(address: "7801 Mandan Rd", monthly_rent: 600, sqft: 1000, num_beds: 3, num_baths: 2)
tenant1 = Tenant.create(name: "Leeroy Jenkins", age: 35, gender: "Male", apartment_id: 21)
tenant2 = Tenant.create(name: "Sheeroy Jenkins", age: 35, gender: "Female", apartment_id: 21)
tenant3 = Tenant.create(name: "Boy Jenkins", age: 15, gender: "Male", apartment_id: 21)
tenant4 = Tenant.create(name: "Girl Jenkins", age: 8, gender: "Female", apartment_id: 21)
tenant5 = Tenant.create(name: "Thomas Bangalter", age: 42, gender: "Male", apartment_id: 20)
tenant6 = Tenant.create(name: "Guy-Manuel de Homem-Christo", age: 43, gender: "Male", apartment_id: 20)
tenant7 = Tenant.create(name: "Hali Bakarr", age: 24, gender: "Female", apartment_id: 22)
tenant8 = Tenant.create(name: "Zayn Malik", age: 24, gender: "Male", apartment_id: 22)
tenant9 = Tenant.create(name: "Carmen Sandiego", age: 40, gender: "Female", apartment_id: 20)
