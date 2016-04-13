### note: Make sure you've loaded the seeds.sql file into your DB before starting
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
#### note: DON'T MODIFY ABOVE THIS LINE     ####
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
retirees = Tenant.where("age > '65'")
# retirees = Tenant.where("age >?" 65)  this maybe works, too.  Or not.
# retirees = Tenant.where("age > 65" :age)  this maybe works, too, too

# get all apartments whose price is greater than $2300
luxury = Apartment.where("monthly_rent > '2300'")

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
damien_tenants = Tenant.all.where(apartment: damien_corners)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

all_tenants.each do |x|
  puts x[:name] + " " + x[:id].to_s
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |x|
  puts x[:address] + " " + x[:monthly_rent].to_s
end


# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# Apartment.all.each do |x|
#   puts x[:address] + " " + all_tenants(x[:name])
# end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# # Create 3 new apartments, and save them to the DB
# the_zone = Apartment.create(address: "2214B 15th St", monthly_rent: 700, sqft: 800, num_beds: 3, num_baths: 1)
# the_loft = Apartment.create(address: "5050 Cuming St", monthly_rent: 3000, sqft: 600, num_beds: 2, num_baths: 1)
# the_box = Apartment.create(address: "1500 Pennsylvania Ave", monthly_rent: 5000, sqft: 200, num_beds: 1, num_baths: 1)
#
# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# mike = Tenant.create(name: "Mike Sindt", age: 30, gender: "Male", apartment: the_zone)
# mark = Tenant.create(name: "Mark Liljehorn", age: 30, gender: "Male", apartment: the_zone)
# leland = Tenant.create(name: "Leland Jordon", age: 30, gender: "Male", apartment: the_zone)
# dave = Tenant.create(name: "Dave Flynn", age: 30, gender: "Male", apartment: the_loft)
# clark = Tenant.create(name: "Clark Wayne", age: 30, gender: "Male", apartment: the_loft)
# kent = Tenant.create(name: "Kent West", age: 30, gender: "Male", apartment: the_loft)
# roger = Tenant.create(name: "Roger Stevenson", age: 30, gender: "Male", apartment: the_box)
# kendra = Tenant.create(name: "Kendra Smythe", age: 30, gender: "Female", apartment: the_box)
# debbie = Tenant.create(name: "Debbie Dallas", age: 30, gender: "Female", apartment: the_box)

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# This doesn't work:
# Tenant.find_by(name: "Kristin Wisoky").update(age: age + 1)
# Neither does .update(age: :age+1) or (age: (age+1)) or (age: age+1) or many others.
# THIS WORKS:
# Tenant.find_by(name: "Kristin Wisoky").increment(:age)

# Renovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Apartment.find_by(address: "62897 Verna Walk").increment(:num_beds)
# Make sure to save the results to your database
# Tenant.find_by(name: "Kristin Wisoky").save
# Apartment.find_by(address: "62897 Verna Walk").save


# Rent Adjustment!
# Update the same apartment that you just 'renovated'. Increase its rent by $400
# to reflect the new bedroom
apartment = Apartment.find_by(address: "62897 Verna Walk")
apartment.monthly_rent += 400
apartment.save
# .increment(:rent +400)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
binding.pry
