require 'active_record'
require_relative 'connection'

require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

# apartments
apartment_one = Apartment.create(address: "42 Fourth Avenue", monthly_rent: 500, sqft:2145, num_beds:3, num_baths:2)
apartment_two = Apartment.create(address:"920 East 40th", monthly_rent:2500, sqft:1160, num_beds:3, num_baths:1.5)
apartment_three = Apartment.create(address:"1014 Argo Lane", monthly_rent:1890, sqft:946, num_beds:1, num_baths:1)


#tenants
addy = Tenant.create(name:"Addy Walker", age:25, gender:"female", apartment_id:21)
samantha = Tenant.create(name:"Samantha Parkington", age:25, gender:"female", apartment_id:21)
molly = Tenant.create(name:"Molly McIntire", age:25, gender:"female", apartment_id:25)
justin = Tenant.create(name:"Justin Tim", age:24, gender:"male", apartment_id:22)
joey = Tenant.create(name:"Joey Fat", age:28, gender:"male", apartment_id:22)
jc = Tenant.create(name:"JC Cha", age:28, gender:"male", apartment_id:22)
tom = Tenant.create(name:"Tommy Pickles", age:22, gender:"male", apartment_id:23)
ivy = Tenant.create(name:"Pamela Isley", age:30, gender:"female", apartment_id:24)
rose = Tenant.create(name:"Rose Isley", age:16, gender:"female", apartment_id:24)
hazel = Tenant.create(name:"Hazel Isley", age:16, gender:"female", apartment_id:24)
