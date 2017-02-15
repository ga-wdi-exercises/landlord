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
tenant_one = Tenant.find(1)
# get all tenants older than 65
all_tenants = Tenant.find_by(age > 65)
# get all apartments whose price is greater than $2300
all_apartments = Apartment.find_by(monthly_rent >$2300)
# get the apartment with the address "6005 Damien Corners"
address_apartment = Apartment.find(:address "6005 Damien Corners")
# get all tenants in that apartment
all_tenants = Tenant.find_by :apartment_id:Apartment.find_by("6005 Damien Corners")

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants = Tenant.all.each do |tenant|
  puts "#{tenant.name} #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all.each do |apartment|
  puts "#{apartment.address} #{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
adress_tenats = Apartment.all.each do |apartment|

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
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
