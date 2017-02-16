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
older_than_sixty = Tenant.where

# get all apartments whose price is greater than $2300
 over_2300 = Apartment.find_by(monthly_rent: 2300)

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: '6005 Damien Corners')

# get all tenants in that apartment
damien_corners_residents = Apartment.find_by(address: '6005 Damien Corners').tenants

# Use `each` and `puts` to:


# Display the name and ID # of every tenant
 Tenant.all.each do |tenant|
   puts "NAME: #{tenant.name}, ID: #{tenant.id}"
   end
# Iterate over each apartment, for each apartment, display it's address and rent price
 Apartment.all.each do |apartment|
   puts "ADDRESS: #{apartment.address}, RENT: #{apartment.monthly_rent}"
   end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

 Apartment.all.each do |apartment|
 puts "ADDRESS: #{apartment.address}"
 apartment.tenants.each do |tenant|
 puts "TENANTS: #{tenant.name}"
 end
 end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB


park_place = Apartment.create(address: "103 Hawthorne ct ne", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
village_court = Apartment.create(address: "1285 Village Ave", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
the_cloisters = Apartment.create(address: "100 michigan ave", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

park_place.tenants.create ([
{name: "Ian Clark", age: 21, gender: "Male"},
{name: "Steph Curry", age: 30, gender: "Male"},
{name: "Kevin Durant", age: 35, gender: "Male"},
{name: "Draymond Green", age: 23, gender: "Male"},
{name: "Andre Inguadola", age: 9, gender:"Male"}
{name: "Klay Thompson", age: 11, gender: "Male"},
{name: "Javale Mcghee", age: 34, gender: "Male"},
{name: "Sean Livingston", age: 34, gender: "Male"},
{name: "Lebron James", age: 23, gender:"Male"}
])


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: 24)



# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database


verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_beds: 3)
verna_walk.save


# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom


verna_walk.update(monthly_rent: 2800)
verna_walk.save


# Millenial Eviction!
# Find all tenants who are under 30 years old

under_30 = Tenant.where("age < 30", :age)

# Delete their records from the DB
under_30.destroy_all

binding.pry
puts "end of file"
