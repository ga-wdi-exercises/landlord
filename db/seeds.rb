require_relative '../db/connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

yemen_rd_apt = Apartment.create(address: "1 Yemen Rd", monthly_rent: 500, sqft: 1000, num_beds: 2, num_baths: 1)
qatar_rd_apt = Apartment.create(address: "10 Qatar Rd", monthly_rent: 600, sqft: 1200, num_beds: 2, num_baths: 2)
emirates_rd_apt = Apartment.create(address: "15 Emirates Rd", monthly_rent: 3500, sqft: 600, num_beds: 1, num_baths: 1)

yemen_rd_apt.tenants.create([
  {name: 'Chandler', age: 41, gender: "m"},
  {name: 'Monica', age: 39, gender: "f"}
  ])
qatar_rd_apt.tenants.create([
  {name: 'Tom', age: 46, gender: "m"},
  {name: 'Dick', age: 41, gender: "m"},
  {name: 'Harry', age: 48, gender: "m"}
  ])
emirates_rd_apt.tenants.create([
  {name: 'Marshall', age: 40, gender: "m"},
  {name: 'Lily', age: 39, gender: "f"},
  {name: 'Ted', age: 41, gender: "m"},
  {name: 'Tracy', age: 38, gender: "f"}
  ])

# binding.pry
#
# puts "EOF"
