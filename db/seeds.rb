require 'bundler/setup'
require 'pry'   #why are these here?

require_relative "../db/connection.rb" # tried appending .rb, prpending /, ., and .. Nothing worked
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

house1 = Apartment.create(address: '36 Southern Slope Dr', monthly_rent: 2500, sqft: 3000, num_beds: 4, num_baths: 3)
house2 = Apartment.create(address: '15 Wake Forrest Rd', monthly_rent: 500, sqft: 200, num_beds: 1, num_baths: 1)
house3 = Apartment.create(address: '1 Test St.', monthly_rent: 900, sqft: 1000, num_beds: 2, num_baths: 2)

house1.tenants.create(name: "Admiral Adama", age: 62, gender: "Male")
house2.tenants.create(name:"Colonel Tye", age:62,gender: "Male")
house3.tenants.create(name:"Starbuck", age:35,gender: "Female")
house1.tenants.create(name:"Apollo", age:36,gender: "Male")
house2.tenants.create(name:"Helio", age:32,gender: "Male")
house3.tenants.create(name:"Dr Gaius Baltar", age:45,gender: "Male")
house1.tenants.create(name:"The Doc", age:67,gender: "Male")
house2.tenants.create(name:"Chief", age:38,gender: "Male")
house3.tenants.create(name:"President Roslin", age:63,gender: "Female")
