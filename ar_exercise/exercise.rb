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

binding.pry
################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
first_tenant = Tenant.first or (Tenant.find(1))

# get all tenants older than 65
older_tenants = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where("monthly_rent > 2300", :rent)

# color = :red
# me = {"name" => "Adam", :age => 30}
# me["name"]
# me[:age]
#
# me = {:name => "Adam", :age => 30}
# me = {name: "Adam", age: 30}

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.where(address: "6005 Damien Corners")

# get all tenants in that apartment
damien_corners.tenants


# Use `each` and `puts` to:
# Display the name and ID # of every tenant

all_tenants.each do |tenant|
  puts tenant.name
  puts tenant.id
end

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apartment|
  puts apartment.address
  puts appartment.monthly_rent
  puts "*" * 50
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apartment|
  apartment.address
  apartment.tenants.each do |tenant|
    puts tenant.name
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment1 = Apartment.create(address: "4128 Baldwin Crescent", monthly_rent: 7500, sqft: 2000, num_beds: 3, num_baths: 2.5)
apartment2 = Apartment.create(address: "4055 Joshua Barney", monthly_rent: 5000, sqft: 1500, num_beds: 2, num_baths: 2)
apartment3 = Apartment.create(address: "1211 Abraham Drive", monthly_rent: 10000, sqft: 3500, num_beds: 5, num_baths: 4)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
new_tenant1 = Tenant.create(name: "Alexander	Hardy", age: "25", gender: "Male", apartment_id: 7)
new_tenant2 = Tenant.create(name: "Sonia Bowen", age: "42", gender: "Female", apartment_id: 14)
new_tenant3 = Tenant.create(name: "Raymond	Adams", age: "28", gender: "Male", apartment_id: 5)
new_tenant4 = Tenant.create(name: "Tyler	French", age: "34", gender: "Male", apartment_id: 12)
new_tenant5 = Tenant.create(name: "Carrie	Bryant", age: "29", gender: "Female", apartment_id: 9)
new_tenant6 = Tenant.create(name: "Allan	Stewart", age: "43", gender: "Male", apartment_id: 19)
new_tenant7 = Tenant.create(name: "Lynne	Yates", age: "22", gender: "Female", apartment_id: 9)
new_tenant8 = Tenant.create(name: "Kelly	Grant", age: "41", gender: "Female", apartment_id: 17)
new_tenant9 = Tenant.create(name: "Ricardo	Benson", age: "36", gender: "Male", apartment_id: 10)
new_tenant10 = Tenant.create(name: "Valerie	Conner", age: "27", gender: "Female", apartment_id: 11)


# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin_wisoky = Tenant.find_by(name: "Kristin Wisoky")
puts kristin_wisoky.age
kristin_wisoky.age = kristin_wisoky.age + 1
puts kristin_wisoky.age

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
apartment_reno = Aparment.find_by(address: "62897 Verna Walk")
puts apartment_reno.num_beds
apartment_reno.num_beds = apartment_reno.num_beds + 1
puts apartment_reno.num_beds


# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
puts apartment_reno.monthly_rent
apartment_reno.monthly_rent = apartment_reno.monthly_rent + 400
puts apartment_reno.monthly_rent

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
mill_tenants = Tenants.where("age < 30")
mill_tenants.each do |millenial|
  millenial.destroy
end
