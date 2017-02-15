require 'active_record'
require 'pg'
require_relative 'db/connection'
require_relative '../models/apartment'
require_relative '../models/tenant'


Tenant.destroy_all
new_tenant = Tenant.create(name:"Kevin Keller", age:23, gender:"Male", apartment_id: 21)
new_tenant = Tenant.create(name:"Dom Houston", age:40, gender:"Male", apartment_id: 20)
new_tenant = Tenant.create(name:"Aaron Andrew", age:17, gender:"Male", apartment_id: 20)
new_tenant = Tenant.create(name:"Gurpreet Gill", age:25, gender:"Male", apartment_id: 20)
new_tenant = Tenant.create(name:"Justin Shin", age:30, gender:"Male", apartment_id: 20)
new_tenant = Tenant.create(name:"Chrisy Johnson", age:16, gender:"Female", apartment_id: 20)
new_tenant = Tenant.create(name:"Amrinder Gill", age:28, gender:"Male", apartment_id: 20)
new_tenant = Tenant.create(name:"Amandeep Gill", age:30, gender:"Female", apartment_id: 22)
new_tenant = Tenant.create(name:"Will Smith", age:45, gender:"Male", apartment_id: 22)


Apartment.destroy_all
new_Apartment = Apartment.create(address:"414 Ginkgo Tr", monthly_rent: 5000, sqft: 4000, num_beds:3, num_baths:2)
new_Apartment = Apartment.create(address:"46690 Play St", monthly_rent: 2500, sqft:1000, num_beds:3, num_baths:2)
new_Apartment = Apartment.create(address:"001 Dope St", monthly_rent: 3500, sqft:1500, num_beds:2, num_baths:1.5)
