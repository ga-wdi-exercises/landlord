require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

John = Tenant.create(name:"John Doe", age: 25, gender:"Male", apartment_id: 21)
Jane = Tenant.create(name:"Jane Doe", age: 30, gender:"Female", apartment_id: 22)
Mary = Tenant.create(name:"Mary Smith", age: 36, gender:"Female", apartment_id: 23)
Joe = Tenant.create(name:"Joe Smith", age: 40, gender:"Male", apartment_id: 24)
Moe= Tenant.create(name:"Moe Zilla", age: 16, gender:"Male", apartment_id: 25)
Laura= Tenant.create(name:"Laura Macy", age: 19, gender:"Female", apartment_id: 26)
Teresa= Tenant.create(name:"Teresa Harper",age: 57, gender:"Female", apartment_id: 27)
Steve= Tenant.create(name:"Steve Smith", age: 48, gender:"Male", apartment_id: 28)
Margaret= Tenant.create(name:"Margaret Cho", age: 47, gender:"Female", apartment_id: 29)

the_lounge= Apartment.create(address:"123 Cloverfield Lane", monthly_rent:670, sqft:500, num_beds:1, num_baths:1)
the_spot= Apartment.create(address:"256 Landsdown Drive", monthly_rent:800, sqft:770, num_beds:2, num_baths:2)
the_parlor= Apartment.create(address:"2020 L Street", monthly_rent:1000, sqft:950, num_beds:3, num_baths:2)
