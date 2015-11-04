require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all #destroy all
Tenant.destroy_all #destroy all

# Apartment.connection.execute('ALTER SEQUENCE apartment_id_seq RESTART WITH 1')
# Tenant.connection.execute('ALTER SEQUENCE tenant_id_seq RESTART WITH 1')

# Artist.create(asdfjjl)

#variable name is not saved

# CREATE TABLE tenants(
#   id SERIAL PRIMARY KEY,
#   name TEXT,
#   age INT,
#   gender TEXT,
#   apartment_id INT
# );

belmont = Apartment.create(address: "4500 Belmont Ave", monthly_rent: 1500, sqft: 800, num_beds: 1, num_baths: 1) # apartment_id is
oregon = Apartment.create(address: "2300 Oregon St", monthly_rent: 1100, sqft: 600, num_beds: 1, num_baths: 1) # apartment_id is
new_york = Apartment.create(address: "9000 New York Ave", monthly_rent: 2500, sqft: 1100, num_beds: 2, num_baths: 2) # apartment_id is

# To create multiple entrees in one statement
# +apartment_list = Apartment.create(
# +  [
# +    {},
# +    {},
# +    {}
# +  ])

# Tenant.create(name: "Bob", age: 23, gender: "male", apartment_id: 20)
gina = belmont.tenants.create(name: "Gina", age: 44, gender: "Female")
bob = belmont.tenants.create(name: "Bob", age: 23, gender: "Male")
tammy = belmont.tenants.create(name: "Tammy", age: 30, gender: "Female")

rebecca = oregon.tenants.create(name: "Rebecca", age: 32, gender: "Female")
michael = oregon.tenants.create(name: "Michael", age: 50, gender: "Male")
rubio = oregon.tenants.create(name: "Rubio", age: 70, gender: "Male")

john = new_york.tenants.create(name: "John", age: 37, gender: "Male")
jake = new_york.tenants.create(name: "Jake", age: 20, gender: "Male")
mindy = new_york.tenants.create(name: "Mindy", age: 30, gender: "Male")

all_tenants = Tenants.all

all_tenants_of_belmont = belmont.tenants

mindy.update(gender: "Female")

mindy.apartment = michael
mindy.save

rubio = Tenant.find_by(name: "Rubio")
rubio.destroy
