### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "rb-readline"

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
first_tenant = Tenant.find(1)

# get all tenants older than 65
senior_tenants = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
damien_apartment = Apartment.find_by(address:'6005 Damien Corners')

# get all tenants in that apartment
damien_tenants = damien_apartment.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "#{tenant[:name]} #{tenant[:id]}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apartment|
  puts "#{apartment[:address]} #{apartment[:monthly_rent]}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apartment|
  puts "#{apartment[:address]}, #{apartment.tenants}"
binding.pry
puts 'cheese'
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment_one = Apartment.create(address: "123 1st St", monthly_rent: 500, sqft: 1000, num_beds: 2, num_baths: 1)
apartment_two = Apartment.create(address: "456 1st Rd", monthly_rent: 750, sqft: 1500, num_beds: 2, num_baths: 2)
apartment_three = Apartment.create(address: "789 1st Pl", monthly_rent: 1000, sqft: 2000, num_beds: 3, num_baths: 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
apartment_one.tenants.create([
  {name: "Dashon", age: 27, gender: "m"},
  {name: "Jessica", age: 26, gender: "f"},
  {name: "Bailey", age: 1, gender: "f"}
])

apartment_two.tenants.create([
  {name: "Jose", age: 45, gender: "m"},
  {name: "Manuela", age: 65, gender: "f"},
  {name: "Enrique", age: 30, gender: "m"}
])

apartment_three.tenants.create([
  {name: "Henry", age: 26, gender: "m"},
  {name: "Adriana", age: 27, gender: "f"},
  {name: "Daniela", age: 26, gender: "f"}
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
