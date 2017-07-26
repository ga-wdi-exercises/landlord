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

#NOTE TO SELF: RUN EXERCISE.RB TO TEST CODE
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
over_65 = Tenant.where('age > 65')
# get all apartments whose price is greater than $2300
over_2300 = Apartment.where('rent > 2300')
# get the apartment with the address "6005 Damien Corners"
6005_damien = Apartment.where('address == "6005 Damien Corners"')
# get all tenants in that apartment
damien_tenants = Tenant.where('address == "6005 Damien Corners"')

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.each do |tenants|
  puts "Tennant Name(s): #{name} /n Apt_id: #{apartment_id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.each do |apartments|
  puts "Address: #{address} /n Monthly rent: #{monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.each do |apartments|
  puts "Address: #{address} /n Tennant(s): #{tenant.name}"
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Shady_Pines = Apartment.new (address: "2536 Rainbow Lane", monthly_rent: 600, sqft: 920:, num_beds: 0, num_baths: 1)
Shady_Pines.save
New_Horizons = Apartment.new (address: "7720 Trout Run", monthly_rent: 820, sqft: 1020:, num_beds: 1, num_baths: 1)
New_Horizons.save
Twin_Falls = Apartment.new (address: "2430 Peake Road", monthly_rent: 1100, sqft: 2000:, num_beds: 2, num_baths: 2)
Twin_Falls.save

Sheila = (name: "Sheila Jones", age: 23, gender: "female", apartment_id: 4)
Sheila.save
Liz = (name: "Liz Girma", age: 36, gender: "female", apartment_id: 4)
Liz.save
Sam = (name: "Sam Qureshi", age: 30, gender: "males", apartment_id: 17)
Sam.save
Olivia = (name: "Olivia Bergen", age: 22, gender: "female", apartment_id: 13)
Olivia.save
Matt = (name: "Matt Shields", age: 27, gender: "male", apartment_id: 13)
Matt.save
Zoe = (name: "Zoe Isakoff", age: 32, gender: "female", apartment_id: 17)
Zoe.save
Rajesh = (name: "Rajesh Prasad", age: 25, gender: "male", apartment_id: 13)
Rajesh.save
Radha = (name: "Radha Mahadevan", age: 29, gender: "female", apartment_id: 17)
Radha.save
James = (name: "James Jacobs", age: 32, gender: "male", apartment_id: 4)
James.save
Mary = (name: "Mary Quesada", age: 29, gender: "female", apartment_id: 17)
Mary.save

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Wisoky_K = Tenant.find_by(name: "Kristin Wisoky")
update.Wisoky_K(age: 24)
Wisoky_K.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Verna_Walk = Apartment.find_by(address: "62897 Verna Walk")
update.Verna_Walk(num_beds: 3)
Verna_Walk.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
update.Verna_Walk('monthly_rent += 400')
Verna_Walk.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
under_30 = Tenant.where('age < 30')
under_30.destroy
