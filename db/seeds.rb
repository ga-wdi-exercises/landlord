require_relative "../db/connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all


newapts= Apartment.create([
  {address: "123 Main St", monthly_rent: 3200.00, sqft: 2500, num_beds: 5, num_baths: 3 },
  {address: "2525 Chasbarb Terrace", monthly_rent: 2865.00, sqft: 1500, num_beds: 3, num_baths: 2 },
  {address: "13 B Givens Lane", monthly_rent: 1200.00, sqft: 1850, num_beds: 4, num_baths: 2 },
])

apt1=Apartment.find_by address: '123 Main St'
p apt1[:id]
apt2=Apartment.find_by address: "2525 Chasbarb Terrace"
p apt2[:id]
apt3=Apartment.find_by address: "13 B Givens Lane"
p apt3[:id]


newtenants= Tenant.create([
  {name: "Michael Rubin", age: 61 , gender: "Male", apartment_id: apt1.id },
  {name: "Ellen Rubin", age: 63 , gender: "Female", apartment_id: apt1.id },
  {name: "Bari Appelstein", age: 65 , gender: "Female", apartment_id: apt1.id },
  {name: "Mark Appelstein", age: 67 , gender: "Male", apartment_id: apt1.id },
  {name: "Barry Rubin", age: 28 , gender: "Male", apartment_id: apt3.id },
  {name: "Erin Bryce", age: 30, gender: "Female", apartment_id: apt2.id },
  {name: "Bill Bryce", age: 33 , gender: "Male", apartment_id: apt2.id },
  {name: "Liam Bryce", age: 1, gender: "Male", apartment_id: apt2.id },
  {name: "Sarah Jo Bryce", age: 65 , gender: "Female", apartment_id: apt3.id },
])
