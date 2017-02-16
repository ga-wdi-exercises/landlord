require 'active_record'

require 'pg'
require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apt_one = Apartment.create(address: "123 New York Ave", monthly_rent: 2000, sqft: 888,num_beds: 1,num_baths: 3)
apt_two = Apartment.create(address: "456 New York Ave", monthly_rent: 2500, sqft: 888,num_beds: 3,num_baths: 4)
apt_three = Apartment.create(address: "789 New York Ave", monthly_rent: 6000, sqft: 888,num_beds: 2,num_baths: 4)

Tenant.create([
  {name: "Abe Abington", age: 25, gender: "Male", apartment_id: 21},
  {name: "Betsy Bettison", age: 25, gender: "Female", apartment_id: 22},
  {name: "Carl Carter", age: 25, gender:"Male", apartment_id: 23},
  {name: "Dee Deson", age: 25, gender: "Female", apartment_id: 24},
  {name: "Eunice Eunch", age: 25, gender: "Female", apartment_id: 25},
  {name: "Fran Futer", age: 25, gender: "Female", apartment_id: 26},
  {name: "Greg Googiepants", age: 25, gender: "Male", apartment_id: 27},
  {name: "Harry Houdini", age: 25, gender: "Male", apartment_id: 28},
  {name: "Ian Iceman", age: 25, gender: "Male", apartment_id: 29},
]);
