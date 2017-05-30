require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all



summit = Apartment.create(address: "215 Grant ave.", monthly_rent: 1200, sqft: 500, num_beds: 2,num_baths: 1)
pearl = Apartment.create(address: "616 Pearl ave.", monthly_rent: 1600, sqft: 1200, num_beds: 3,num_baths: 2)
copper_beach = Apartment.create(address: "300 Mile Ground rd.", monthly_rent: 1800, sqft: 1000, num_beds: 4,num_baths: 2)



shmitty = Tenant.create(name: "Shmitty Werben-Jagerman-Jenson",age: 77,gender: "Male",apartment: summit)
sponge= Tenant.create(name: "Sponge-Bob Square-Pants",age: 26,gender: "Male",apartment: pearl)
patrick = Tenant.create(name: "Patrick Star",age: 27,gender: "Male",apartment: pearl)
sandy = Tenant.create(name: "Sandy Cheeks",age: 28,gender: "Female",apartment: pearl)
krabs = Tenant.create(name: "Mr. Krabs",age: 45,gender: "Male",apartment: copper_beach)
pk = Tenant.create(name: "Pearl Krabs",age: 19,gender: "Female",apartment: copper_beach)
squid = Tenant.create(name: "Squidward",age: 34,gender: "Male",apartment: copper_beach)
plank = Tenant.create(name: "Plankton",age: 28,gender: "Male",apartment: summit)
mm = Tenant.create(name: "Mermaid Man",age: 88,gender: "Male",apartment: copper_beach)


