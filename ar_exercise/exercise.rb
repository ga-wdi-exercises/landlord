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
older_tenants = Tenant.where "age > 65"

# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where "monthly_rent > 2300"

# get the apartment with the address "6005 Damien Corners"
damien_apartment = Apartment.where address: "6005 Damien Corners"

# get all tenants in that apartment

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "Name: #{tenant.name}. ID \#: #{tenant.id}."
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "Address: #{apartment.address}. Rent: #{apartment.monthly_rent}."
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
riverway = Apartment.create(address: "360 Riverway", monthly_rent: 1800, sqft: 1000, num_beds: 1, num_baths: 1)

canbridge = Apartment.create(address: "100 Emeral Necklace", monthly_rent: 2000, sqft: 1500, num_beds: 2, num_baths: 1)

madison = Apartment.create(address: "2628 Madison Park", monthly_rent: 2800, sqft: 3000, num_beds: 3, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
ryan = Tenant.create(name: "Ryan Dungey", age: 35, gender: "Male", apartment_id: 23)

juliana = Tenant.create(name: "Juliana Daniels", age: 30, gender: "Female", apartment_id: 22)

bill = Tenant.create(name: "Bill Ashman", age: 60, gender: "Male", apartment_id: 23)

penny = Tenant.create(name: "Penny Ashman", age: 58, gender: "Female", apartment_id: 23)

chad = Tenant.create(name: "Chad Reed", age: 40, gender: "Male", apartment_id: 21)

carol = Tenant.create(name: "Carol Burnet", age: 35, gender: "Female", apartment_id: 21)

cindy = Tenant.create(name: "Cindy Crawford", age: 50, gender: "Female", apartment_id: 22)

ken = Tenant.create(name: "Ken Roczen", age: 48, gender: "Male", apartment_id: 22)

mimy = Tenant.create(name: "Mimy Ashman", age: 12, gender: "Female", apartment_id: 23)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristy = Tenant.find_by(name: "Kristin Wisoky")
kristy.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
evicted = Tenant.where("age < 30")
evicted.destroy_all
