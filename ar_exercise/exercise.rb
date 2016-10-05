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
tenant_one = Tenant.first
# get all tenants older than 65
old_tenants = Tenant.where("age >= 65")
# get all apartments whose price is greater than $2300
ballers = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by address: '6005 Damien Corners'

# get all tenants in that apartment
damien_tenants = Tenant.find 6

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |tent|
  puts "name: #{tent.name} and ID: #{tent.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |apt|
  puts "address #{apt.address} and price: #{apt.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_each do |apt|
  puts "address: #{apt.address}"
Tenants
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
one = Apartment.create(:address => '1234 River Street', :monthly_rent => 1200, :sqft => 2300, :num_beds => 4, :num_baths =>1)
two = Apartment.create(:address => '892 Happy Feet Street', :monthly_rent => 1700, :sqft => 2100, :num_beds => 5, :num_baths => 2)
three = Apartment.create(:address => '900 Elizabeth Ave', :monthly_rent => 9000, :sqft => 4100, :num_beds => 6, :num_baths => 4)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)


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
