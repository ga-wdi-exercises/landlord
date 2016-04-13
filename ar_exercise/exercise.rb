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

binding.pry
# get the first tenant in the DB
  #  first_tenant = all_tenants.find(0)

# get all tenants older than 65
  # seniors = Tenant.where("age > 65", :age)

# get all apartments whose price is greater than $2300
  # expensive_apartments = Apartment.where("monthly_rent > 2300", :monthly_rent)

# get the apartment with the address "6005 Damien Corners"
  # damien_corners = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
  # damien_residents = damien_corners.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
  # all_tenants.each do |tenant|
  # puts "Name: #{tenant.name}, Id: #{tenant.id}"
  # end

# Iterate over each apartment, for each apartment, display it's address and rent price
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
  # zanehs_house = Apartment.create(address: "29 Fairhill Lane", monthly_rent: 200, sqft: 3000, num_beds: 3, num_baths: 4)
  # grandmas_house = Apartment.create(address: "6508 Springbrook Lane", monthly_rent: 400, sqft: 3200, num_beds: 4, num_baths: 6)
  # random_house = Apartment.create(address: "670 Fairy Lane", monthly_rent: 900, sqft: 2000, num_beds: 2, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
  # Tenant.create(name: "Zaneh", age: 23, gender: "female", apartment_id: 21)
  # Tenant.create(name: "Ajeh", age: 21, gender: "female", apartment_id: 21)
  # Tenant.create(name: "Keisha", age: 47, gender: "female", apartment_id: 21)
  # Tenant.create(name: "Savon", age: 22, gender: "male", apartment_id: 21)
  # Tenant.create(name: "Thomas", age: 76, gender: "male", apartment_id: 22)
  # Tenant.create(name: "Mattie", age: 70, gender: "female", apartment_id: 22)
  # Tenant.create(name: "Fairy One", age: 34, gender: "female", apartment_id: 23)
  # Tenant.create(name: "Fairy Two", age: 30, gender: "female", apartment_id: 23)
  # Tenant.create(name: "Fairy Three", age: 36, gender: "male", apartment_id: 23)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
  # all_tenants.find_by(name: "Kristin Wisoky")

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Tenant.find_by(address: "62897 Verna Walk")

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
