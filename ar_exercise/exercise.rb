### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

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


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
first_tendant = Apartment.first.tenants
# get all tenants older than 65
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
Apartment.create([
  {address: "123 Main St", monthly_rent: 1500, sqft: 900, num_beds: 2, num_baths: 1},
  {address: "34 Main St", monthly_rent: 600, sqft: 700, num_beds: 1, num_baths: 1},
  {address: "99 Something St", monthly_rent: 900, sqft: 800, num_beds: 1, num_baths: 1}
  ])
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Apartment.all[0].tenants.create([
  {name: "Chanler", age: 45, gender: "Male"},
  {name: "Joey", age: 44, gender: "Male"},
  ])
Apartment.all[1].tenants.create([
  {name:"Rachel", age: 40, gender: "Female"},
  {name: "Monica". age: 41, gender: "Female"},
  {name: "Pheobie", age: 40, gender: "Female"}
  ])
Apartment.all[2].tenants.create([
  {name: "Ross", age: 45, gender: "Male"}
  ])
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
