Apartment.create(address: "10707 Weymouth Street", monthly_rent: 1000 ,sqft: 5000,num_beds: 3, num_baths: 4)
Apartment.create(address: "10708 Weymouth Street", monthly_rent: 2000 ,sqft: 6000,num_beds: 4, num_baths: 4)
Apartment.create(address: "10709 Weymouth Street", monthly_rent: 3000 ,sqft: 7000,num_beds: 5, num_baths: 5)
Tenant.create(name: "Davis", age: 30, gender: "Male", apartment_id: 1)
Tenant.create(name: "John", age: 33, gender: "Male", apartment_id:2)
Tenant.create(name: "Matt", age: 35, gender: "Male", apartment_id:2)
Tenant.create(name: "Ian", age: 29, gender: "Male", apartment_id:2)
Tenant.create(name: "Catherine", age: 27, gender: "Female", apartment_id: 1)
Tenant.create(name: "Laurin", age: 35, gender: "Female", apartment_id: )
Tenant.create(name: "Louisa", age: 50, gender: "Female", apartment_id: )
Tenant.create(name: "Theodore", age: 60, gender: "Male", apartment_id: 1)
Tenant.create(name: "Jacob", age: 10, gender: "Male", apartment_id:1)
Tenant.create(name: "Fred", age: 10, gender: "Male", apartment_id:1)

tenantsAll = Tenant.all
#queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
tenantsOne = Tenant.where(apartment_id:1)
#Updates attributes using attribute helper methods for one of the objects you've created

#Saves an object that you updated using attribute helpers to the Database

#Updates an object using the update methods

#Deletes one of the objects you've created
