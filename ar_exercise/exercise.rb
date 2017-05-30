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
first_tenant = Tenant[0]

# get all tenants older than 65
old_tenants = Tenant.where(params[:age] > 65)

# get all apartments whose price is greater than $2300
price_app = Apartment.where(params[:monthly_rent] > 2300)

# get the apartment with the address "6005 Damien Corners"
damien_app = Apartment.where(params[:address] == "6005 Damien Corners")

# get all tenants in that apartment
all_damien_app = Apartment.all(params[:address] == "6005 Damien Corners")

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.each do |item|
  puts "params[:name], params[:id]"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
for Apartment.each do |item|
  puts "params[:address], params[:monthly_rent]"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
for Apartment.each do |item|
  puts "params[:address]"
  for Tenants.each do |items|
    puts "params[:name]"
  end
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
new_apartment = Apartment.create([
  {address: "1301 U st", monthly_rent: 2100,  sqft: 1000, num_beds: 1, num_baths: 1},
  {address: "1302 U st", monthly_rent: 2500,  sqft: 1100, num_beds: 2, num_baths: 2},
  {address: "1303 U st", monthly_rent: 3400,  sqft: 1200, num_beds: 2, num_baths: 2}
  ])
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
new_tenant_one = Apartment.all[0].tenants.create([
  {name: "Roy", age: 29, gender: "m"},
  {name: "Troy", age: 16, gender: "m"},
  {name: "Bob", age: 35, gender: "m"}
  ])
new_tenant_two = Apartment.all[1].tenants.create([
  {name: "Susan", age: 27, gender: "f"},
  {name: "Lilly", age: 32, gender: "f"},
  {name: "Theo", age: 28, gender: "m"}
  ])
new_tenant_three = Apartment.all[2].tenants.create([
  {name: "Jessica", age: 21, gender: "f"},
  {name: "Clare", age: 29, gender: "f"},
  {name: "Basil", age: 28, gender: "m"}
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
