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
first_tennant = Tenant.first
# get all tenants older than 65
old_tennants = Tenant.where("age > 65", :age)
# get all apartments whose price is greater than $2300
fancy_apartments = Apartments.where("monthly_rent > 2300", :monthly_rent)
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: = '6005 Damien Corners')
# get all tenants in that apartment
damien_corners_tenants = Apartment.find_by(address: = '6005 Damien Corners').tenant

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
tenant_id_name = Tenant.all.each(|x| puts "#{x.name}, #{x.id}")
# Iterate over each apartment, for each apartment, display it's address and rent price
apartment_address_price = Apartment.all.each(|x| "#{x.address}, #{x.monthly_rent}")
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# apartment_tenant = Apartment.each(|x| )

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "9841 Tanner Key", monthly_rent: 606, sqft: 779, num_beds: 2, num_baths: 1)
Apartment.create(address: "6971 Corwin Locks", monthly_rent: 1600, sqft: 650, num_beds: 1, num_baths: 1)
Apartment.create(address: "630 McDermott Islands", monthly_rent: 1200, sqft: 500, num_beds: 1, num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Ms. Maryse Farrell", age: 87, gender: 'Female', apartment_id: 8)
Tenant.create(name: "Maci Hickle II", age: 28, gender: 'Female', apartment_id: 1)
Tenant.create(name: "Jordan Cremin DDS", age: 54, gender: 'Male', apartment_id: 13)
Tenant.create(name: "Haven Abbott", age: 79, gender: 'Female', apartment_id: 1)
Tenant.create(name: "Roxane Walter", age: 51, gender: 'Female', apartment_id: 16)
Tenant.create(name: "Dr. Everett Kuhn", age: 71, gender: 'Male', apartment_id: 14)
Tenant.create(name: "Ella Quigley DDS", age: 40, gender: 'Female', apartment_id: 13)
Tenant.create(name: "Miss Flavio Wyman", age: 64, gender: 'Female', apartment_id: 11)
Tenant.create(name: "Mathilde Beatty", age: 83, gender: 'Female', apartment_id: 7)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin_w = Tenant.find_by(name: "Kristin Wisoky")
kristin_w.age += 1
kristin_w.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_update = Apartment.find_by(address: "62897 Verna Walk")
verna_update.num_beds +=1
verna_update.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_update.monthly_rent += 400
verna_update.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
young_tenants = Tenant.where("age < 30", :age)
young_tenants.destroy_all
