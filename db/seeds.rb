require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment"
require_relative "models/tenant"

Apartment.destroy_all
Tenant.destroy_all

Apartment.create(address: '36 Southern Slope Dr', monthly_rent: 2500, sqft: 3000, num_beds: 4, num_baths: 3)
Apartment.create(address: '15 Wake Forrest Rd', monthly_rent: 500, sqft: 200, num_beds: 1, num_baths: 1)
Apartment.create(address: '1 Test St.', monthly_rent: 900, sqft: 1000, num_beds: 2, num_baths: 2)

Tenant.create(name: "Admiral Adama", age: 62, gender: "Male", apartment_id: 1)
Tenant.create(name:"Colonel Tye", age:62,gender: "Male", apartment_id: 2)
Tenant.create(name:"Starbuck", age:35,gender: "Female", apartment_id: 3)
Tenant.create(name:"Apollo", age:36,gender: "Male", apartment_id: 1)
Tenant.create(name:"Helio", age:32,gender: "Male", apartment_id: 2)
Tenant.create(name:"Dr Gaius Baltar", age:45,gender: "Male", apartment_id: 3)
Tenant.create(name:"The Doc", age:67,gender: "Male", apartment_id: 1)
Tenant.create(name:"Chief", age:38,gender: "Male", apartment_id: 2)
Tenant.create(name:"President Roslin", age:63,gender: "Female", apartment_id: 3)
