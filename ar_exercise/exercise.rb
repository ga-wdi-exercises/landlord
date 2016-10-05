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
first_tenant = Tenant.find(1)
# get all tenants older than 65
older_tenants = Tenant.where(age: > 65)
# get all apartments whose price is greater than $2300
price = Apartment.where(monthly_rent: > 2300)
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_tenant = Tenant.all(address: "6005 Damien Corners")

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
tenants.each do
  |tenant|
  puts [:name] [:ID]
end
# Iterate over each apartment, for each apartment, display it's address and rent price
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment_one = Apartment.create(address: "514 university dr", monthly_rent: 550, sqft: 400, num_beds: 1, num_baths: 1)
apartment_two = Apartment.create(address: "1400 O St", monthly_rent: 850, sqft: 800, num_beds: 2, num_baths: 2)
apartment_three = Apartment.create(address: "613 U St", monthly_rent: 700, sqft: 650, num_beds: 2, num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
jetta = Tenant.create("Jetta Murphy", 34, "Male", 1)
henry = Tenant.create("Henry Smith", 70, "Male", 1)
mary = Tenant.create("Mary Johnson", 43, "Female", 2)
larry = Tenant.create("Larry Johnson", 39, "Male", 2)
sam = Tenant.create("Sam Smith", 20, "Female", 3)
bella = Tenant.create("Bella Diaz", 25, "Female", 3)
neil = Tenant.create("Neil Schwab", 50, "Female", 4)
jaz = Tenant.create("Jaz Jazzy", 30, "Male", 4)
cam = Tenant.create("Cam Newton", 34, "Female", 5)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name:"Kristin Wisoky")
kristin.update(age: [:age] +1)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.update()
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
renovated = verna
renovated.update()
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.all(age: <30)
