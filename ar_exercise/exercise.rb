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
senior_tenants = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
pricy_apts = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
damien_corners_tenants = Tenant.where(apartment_id: damien_corners.id)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |person|
  puts "ID: #{person.id}] #{person.name}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all

all_apartments.each do |unit|
    puts "@ #{unit.address}: $#{unit.monthly_rent}/month"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |unit|
    tenants_at = Tenant.where(apartment_id: unit.id).inspect
    puts "@ #{unit.address} Tenant: #{tenants_at} "
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "666 Tubtopia Terrace", monthly_rent: 0, sqft: 1999, num_beds: 1, num_baths: 12)
Apartment.create(address: "123 Bedsofall Pozibul-Werlds Blvd", monthly_rent: 0, sqft: 540, num_beds: 12, num_baths: 1)
Apartment.create(address: "1 Everyplace Ever Place", monthly_rent: 9999, sqft: 9, num_beds: 0, num_baths: 0)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: "Hugh Tub Daughtcaum", age: 19, gender: "TUB", apartment_id: 19)
Tenant.create(name: "King Tubby", age: 56, gender: "Male", apartment_id: 19)
Tenant.create(name: "Cuthbert Calculus", age: 87, gender: "Male", apartment_id: 19)

Tenant.create(name: "Bedward Bedison", age: 19, gender: "BED", apartment_id: 20)
Tenant.create(name: "Beddy Bedder", age: 54, gender: "Male", apartment_id: 20)
Tenant.create(name: "Beddy White", age: 95, gender: "Female", apartment_id: 20)

Tenant.create(name: "Lord Running Clam", age: 924, gender: "Ganymedean Slime Mold", apartment_id: 21)
Tenant.create(name: "Milly Len Yial-O'iPhone", age: 15, gender: "Male", apartment_id: 21)
Tenant.create(name: "Billy Pilgrim", age: -1, gender: "Male", apartment_id: 21)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristiiinnnn_omg = Tenant.all.find_by(name: "Kristin Wisoky")
binding.pry
# kristiiinnnn_omg.age = kristiiinnnn_omg.age + 1
# kristiiinnnn_omg.save
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
renno_omg = Apartment.find_by(address: "62897 Verna Walk")
renno_omg.num_beds = renno_omg.num_beds +  1
renno_omg.save
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
renno_omg.monthly_rent += 400
# Millenial Eviction!
# Find all tenants who are under 30 years old
negative_fantasy_transferrence_objects = all_tenants.where("age < 30")
binding.pry
# Delete their records from the DB
negative_fantasy_transferrence_objects.each do |end_loser|
  end_loser.destroy
end
