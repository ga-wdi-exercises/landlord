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
all_tenants = Tenant.all;

# get the first tenant in the DB
first_tenant = Tenant.first;
# get all tenants older than 65
elderly = Tenant.all WHERE (tenants.age>65);
# get all apartments whose price is greater than $2300
ballin = Apartment.all WHERE (apartment.monthly_rent>2300)
# get the apartment with the address "6005 Damien Corners"
dcorners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
dcorners_id = Apartment.apartment_id WHERE (apartment.address = "6005 Damien Corners")
return Tenant.all WHERE (apartment.id == dcorners_id)
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts tenant.name
  puts tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts apartment.address
  puts apartment.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all each do |apartment|
  puts apartment.address
  apartment.tenants.each do |tenant|
    puts tenant.name
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
queenstown = Apartment.create(address: '3227 Chillum Rd', sqft: 930, monthly_rent: 1400, num_beds: 2, num_baths: 1)
brookland_ridge = Apartment.create(address: '400 Taylor St. NE', sqft: 1150, monthly_rent: 1800, num_beds: 2, num_baths: 1)
cypress_creek = Apartment.create(address: '5603 Cypress Creek Dr', sqft: 980, monthly_rent: 1650, num_beds: 2, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
queenstown.tenants.create(name: 'Macey Simone', age: 23, gender: 'female')
queenstown.tenants.create(name: 'Cassidy Browden', age: 23, gender: 'female')
queenstown.tenants.create(name: 'Nashay Washington', age: 29, gender: 'female')
queenstown.tenants.create(name: 'Tenille Middleton', age: 21, gender: 'female')
cypress_creek.tenants.create(name: 'Darrien Joseph', age: 27, gender: 'male')
cypress_creek.tenants.create(name: 'Afia Wilson', age: 25, gender: 'female')
cypress_creek.tenants.create(name: 'Jon-Michael Rosenberg', age: 26, gender: 'male')
brookland_ridge.tenants.create(name: 'Joshua Taborn', age: 28, gender: 'male')
brookland_ridge.tenants.create(name: 'Ashon Henderson', age: 24, gender: 'male')
brookland_ridge.tenants.create(name: 'Tyler Wilson', age: 30, gender: 'male')
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Tenant.find_by (name: 'Kristin Wisoky').increment!(:age , 1)
#? can I do that? may have to set equal to a variable and variable.age += 1
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.num_beds += 1
verna.save
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: (monthly_rent+=400))
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.all.each do |tenant|
  tenant.destroy WHERE tenant.age<30
end
