require 'active_record'
require 'pg'
require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "4827 Rossmoor Place", monthly_rent: 500, sqft: 800, num_beds: 2, num_baths: 2)
Apartment.create(address: "1734 Summit St", monthly_rent: 400, sqft: 400, num_beds: 1, num_baths: 1)
Apartment.create(address: "3422 Partridge Place", monthly_rent: 600, sqft: 900, num_beds: 1, num_baths: 2)

Tenant.create(name:"Deion Sanders",age:43,gender:"Male",apartment_id:5)
Tenant.create(name:"Jerome Bettis",age:39,gender:"Male",apartment_id:7)
Tenant.create(name:"Serena Williams",age:29,gender:"Female",apartment_id:2)
Tenant.create(name:"Halle Berry",age:49,gender:"Female",apartment_id:8)
Tenant.create(name:"Jerry Rice",age:49,gender:"Male",apartment_id:1)
Tenant.create(name:"Pastor Troy",age:36,gender:"Male",apartment_id:2)
Tenant.create(name:"Marshawn Lynch",age:30,gender:"Male",apartment_id:5)
Tenant.create(name:"Steve Smith",age:39,gender:"Male",apartment_id:9)
Tenant.create(name:"Angela Bassett",age:55,gender:"Female",apartment_id:4)
