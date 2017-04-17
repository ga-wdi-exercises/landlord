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
  first_tenant = Tenant.first

# get all tenants older than 65
  older_tenants = Tenant.where("age>65")
# get all apartments whose price is greater than $2300
  high_rent = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
  damien = Apartment.where(address = "6005 Damien Corners")
# get all tenants in that apartment
  all_damien = Tenant.where("apartment_id = 6")

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# Iterate over each apartment, for each apartment, display it's address and rent price
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
  apartment1 = Apartment.create(address: '1601 Argonne Pl NW', monthly_rent: 1925, sqft: 750, num_beds: 1, num_baths: 1)
  apartment2 = Apartment.create(address: '1523 22nd St NW', monthly_rent: 2200, sqft: 1000, num_beds: 3, num_baths: 2)
  apartment3 = Apartment.create(address: '530 Overbrook Rd', monthly_rent: 1500, sqft: 1200, num_beds: 2, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
  # INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Maudie Mosciski', 90, 'Female', 1);
  erin = Tenant.create(name: 'Erin Dawson', age: 36, gender: 'Female', apartment_id: 20)
  kendelyn = Tenant.create(name: 'Kendelyn Ouellette', age: 24, gender: 'Female', apartment_id: 20)
  bryan = Tenant.create(name: 'Bryan Dawson', age: 34, gender: 'Male', apartment_id: 20)
  mike = Tenant.create(name: 'Mike Del Rey', age: 36, gender: 'Male', apartment_id: 22)
  kate = Tenant.create(name: 'Kate Campagna', age: 29, gender: 'Female', apartment_id: 22)
  magan = Tenant.create(name: 'Magan Ruthke', age: 36, gender: 'Female', apartment_id: 22)
  jon = Tenant.create(name: 'Jonathan Harris', age: 26, gender: 'Male', apartment_id: 24)
  jose = Tenant.create(name: 'Jose Alfaro', age: 35, gender: 'Male', apartment_id: 24)
  pete = Tenant.create(name: 'Peter Pruitt', age: 30, gender: 'Male', apartment_id: 24)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
  kristin = Tenant.find_by(name: 'Kristin Wisoky')
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
  nine = Apartment.find_by(address: '62897 Verna Walk')
  nine.update(num_beds: 3)
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
  nine.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
  millenials = Tenant.where(age:(0..29))
# Delete their records from the DB
Tenant.where(age: 0..29).destroy_all

binding.pry

puts"end of file"
