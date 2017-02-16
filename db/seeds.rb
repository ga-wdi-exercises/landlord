require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(
address: "123 Main St Apt 1",
monthly_rent: 1000,
sqft: 800,
num_beds: 1,
num_baths: 5,
)
Apartment.create(
address: "123 Main St Apt 2",
monthly_rent: 1000,
sqft: 800,
num_beds: 1,
num_baths: 5,
)
Apartment.create(
address: "123 Main St Apt 3",
monthly_rent: 1000,
sqft: 800,
num_beds: 1,
num_baths: 5,
)

Tenant.create(
name: "Clark Kent",
age: 40,
gender: "Male",
apartment_id: 40
)
Tenant.create(
name: "Peter Parker",
age: 25,
gender: "Male",
apartment_id: 41
)
Tenant.create(
name: "Bruce Wayne",
age: 45,
gender: "Male",
apartment_id: 42
)
Tenant.create(
name: "Hal Jordan",
age: 35,
gender: "Male",
apartment_id: 43
)
Tenant.create(
name: "Tony Stark",
age: 45,
gender: "Male",
apartment_id: 44
)
Tenant.create(
name: "Diana Prince",
age: 33,
gender: "Female",
apartment_id: 45
)
Tenant.create(
name: "Barry Allen",
age: 29,
gender: "Male",
apartment_id: 46
)
Tenant.create(
name: "Barbara Gordon",
age: 19,
gender: "Female",
apartment_id: 47
)
Tenant.create(
name: "Dick Grayson",
age: 22,
gender: "Male",
apartment_id: 47
)
