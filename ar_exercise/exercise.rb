### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

# DO EXERCISES IN PRY!!!

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################

# binding.pray

################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
# Before running pry, run file through ruby (fil)

all_tenants = Tenant.all

# get the first tenant in the DB
all_tenants = Tenant.first
# get all tenants older than 65
all_tenants = Tenant.where("age: > ?" "65")

# get all apartments whose price is greater than $2300
# get the apartment with the address "6005 Damien Corners"
# get all tenants in that apartment

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# Iterate over each apartment, for each apartment, display it's address and rent price
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
the_bat_cave = Apartment.create(address: "123 Main St", monthly_rent: 2000, sqft: 600, num_beds: 2, num_baths: 1)
# ID 22
the_sinatra = Apartment.create(address: "1094 Bergen St", monthly_rent: 1800, sqft: 700, num_beds: 2, num_baths: 1)
# ID 23
the_wu_tang = Apartment.create(address: "2970 Flatbush Ave", monthly_rent: 1100, sqft: 650, num_beds: 1.5, num_baths: 1)
# ID 24
the_jeter = Apartment.create(address: "825 Fulton St", monthly_rent: 1300, sqft: 480, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
margaret = Tenant.create(name: "Margaret", age: 24, gender: "Female", apartment_id: 22)
adam = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment_id: 24)
benedict = Tenant.create(name: "Benedict", age: 85, gender: "Male", apartment_id: 22)
georgia = Tenant.create(name: "Georgia", age: 49, gender: "Female", apartment_id: 24)
olu = Tenant.create(name: "Olu", age: 28, gender: "Male", apartment_id: 24)
benson = Tenant.create(name: "Benson", age: 41, gender: "Male", apartment_id: 23)
shukura = Tenant.create(name: "Shukura", age: 29, gender: "Female", apartment_id: 22)
ross = Tenant.create(name: "Ross", age: 28, gender: "Male", apartment_id: 23)
cassandra = Tenant.create(name: "Cassandra", age: 26, gender: "Female", apartment_id: 23)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB


binding.pry
