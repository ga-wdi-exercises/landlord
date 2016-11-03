require 'active_record'
require_relative 'connection'

# models
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: '70335 Clemenargaertine Tunnel', monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths: 2)
Apartment.create(address: '44010 Lemke Crossroad', monthly_rent: 1000, sqft: 1300, num_beds: 1, num_baths: 3)
Apartment.create(address: '77841 Jany Lane', monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths: 3)

Tenant.create(name: "Maudie Mosciski", age: 90, gender: "Female", apartment_id: 1)
Tenant.create(name: "Kristin Wisoky", age: 23, gender: "Female", apartment_id: 1)
Tenant.create(name: "Demario King", age: 71, gender: "Male", apartment_id: 1)
Tenant.create(name: "Kaitlin Cormier", age: 91, gender: "Female", apartment_id: 2)
Tenant.create(name: "Rosalinda Champlin", age: 39, gender: "Male", apartment_id: 2)
Tenant.create(name: "Valentin Keebler Sr.", age: 74, gender: "Male", apartment_id: 2)
Tenant.create(name: "Ms. Garland Beatty", age: 60, gender: "Female", apartment_id: 3)
Tenant.create(name: "Eryn Lynch", age: 12, gender: "Male", apartment_id: 3)
Tenant.create(name: "Tiara Conn", age: 31, gender: "Female", apartment_id: 3)
