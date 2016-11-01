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
older_tenants = Tenant.where(:age > 65)

# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where(:monthly_rent > 2300)

# get the apartment with the address "6005 Damien Corners"
damien_apartment = Apartment.where(:address = "6005 Damien Corners")

# get all tenants in that apartment
damien_tenants = Apartment.where(:address = "6005 Damien Corners").tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "Name: #{tenant.name}, ID: #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "Address: #{apartment.address}, Rent: #{apartment.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts apartment.address
  apartment.tenants.each do |tenant|
    puts tenant.name
  end
  puts "-" * 50
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
funnie_house = Apartment.create(address: "123 Bluffington Ave", monthly_rent: 2000, sqft: 2000, num_beds: 4, num_baths: 2)

valentine_house = Apartment.create(address: "456 Bluffington Ave", monthly_rent: 1900, sqft: 2500, num_beds: 5, num_baths: 2)

mayonnaise_house = Apartment.create(address: "987 Bluffington Ave", monthly_rent: 1600, sqft: 800, num_beds: 2, num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

funnie_house.tenants.create(name: "Doug Funnie", age: 11, gender: "Male")
funnie_house.tenants.create(name: "Phil Funnie", age: 43, gender: "Male")
funnie_house.tenants.create(name: "Judy Funnie", age: 15, gender: "Female")
funnie_house.tenants.create(name: "Theda Funnie", age: 43, gender: "Female")
funnie_house.tenants.create(name: "Cleopatra Funnie", age: 1, gender: "Female")

mayonnaise_house.tenants.create(name: "Patti Mayonnaise", age: 11, gender: "Female")
mayonnaise_house.tenants.create(name: "Chad Mayonnaise", age: 40, gender: "Male")

valentine_house.tenants.create(name: "Skeeter Valentine", age: 11, gender: "Male")
valentine_house.tenants.create(name: "Dale Valentine", age: 1, gender: "Male")
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
