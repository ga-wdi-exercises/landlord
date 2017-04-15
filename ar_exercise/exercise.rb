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
all_apartments = Apartment.all
# get the first tenant in the DB
Tenant.find(1)
# # get all tenants older than 65
Tenant.where('age > 65')
# # get all apartments whose price is greater than $2300
Apartment.where('monthly_rent > 2300')
# # get the apartment with the address "6005 Damien Corners"
Apartment.where(address: "6005 Damien Corners")
# # get all tenants in that apartment
Tenant.where('apartment_id = 6')

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts tenant.name
  puts tenant.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments.each do |apartment|
  puts apartment.address
  puts apartment.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apartment|
  puts apartment.address
  id = apartment.id
  their_tenants = all_tenants.where('apartment_id = id')
  their_tenants.each do |tenant|
    puts tenant.name
    end
  end




################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

new_apartment_one = Apartment.create(address: "394 Green Acres Lane", monthly_rent: 5600, sqft: 700, num_beds: 5, num_baths: 3)
new_apartment_two = Apartment.create(address: "123 Cherry Hill Lane", monthly_rent: 9600, sqft: 900, num_beds: 8, num_baths: 2)
new_apartment_three = Apartment.create(address: "600 City Lane", monthly_rent: 600, sqft: 90, num_beds: 7, num_baths: 3)
Apartment.create([
  {address: "786 Green Hill Road", monthly_rent: 899, sqft: 897, num_beds: 8, num_baths: 8},
  {address: "908 Loop Lane", monthly_rent: 7899, sqft: 897, num_beds: 1, num_baths: 1},
  {address: "456 My Street", monthly_rent: 7890, sqft: 500, num_beds: 6, num_baths: 3},
  ])
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

Tenant.create([
    {name: "David Brown", age: 30, gender: "male", apartment_id: 4},
    {name: "Whitney Green", age: 80, gender: "female", apartment_id: 8},
    {name: "Sam Orange", age: 45, gender: "male", apartment_id: 9},
    {name: "Elaine Purdum", age: 60, gender: "female", apartment_id: 12},
    {name: "Don Purdum", age: 68, gender: "male", apartment_id: 15},
    {name: "Barrett Purdum", age: 36, gender: "male", apartment_id: 7},
    {name: "Lisa Straus", age: 35, gender: "female", apartment_id: 10},
    {name: "Mike Maher", age: 40, gender: "male", apartment_id: 5},
    {name: "Nancy McWhorter", age: 67, gender: "female", apartment_id: 6},

  ])
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
  Kristin = Tenant.find_by(name: "Kristin Wisoky")
  Kristin.age = 24
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
  renovation = Apartment.find_by(address: "62897 Verna Walk")
  renovation.num_beds = 3
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
  renovation.monthly_rent = 2800
# Millenial Eviction!
# Find all tenants who are under 30 years old
  millenials = Tenant.where('age < 30')

# Delete their records from the DB
  #millenials.destroy_all


binding.pry

puts "end of application"
