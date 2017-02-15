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
# p all_tenants

# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
older_than = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
expensive = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by("address = '6005 Damien Corners'")

# get all tenants in that apartment
damien_tenants = damien.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts tenant.name, tenant.id
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts apartment.address, apartment.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts apartment.address, apartment.tenants
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment_one = Apartment.create(address: "1 1st. NW", monthly_rent: 1000, sqft: 100, num_beds: 2, num_baths: 1)
apartment_two = Apartment.create(address: "2 2st. NW", monthly_rent: 2000, sqft: 200, num_beds: 3, num_baths: 2)
apartment_three = Apartment.create(address: "3 3st. NW", monthly_rent: 3000, sqft: 300, num_beds: 4, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
tenant_one = Tenant.create(name: "Arther King", age: 20, gender: "male", apartment_id: 20)
tenant_two = Tenant.create(name: "John Sena", age: 30, gender: "male", apartment_id: 20)
tenant_three = Tenant.create(name: "Beyonce", age: 40, gender: "female", apartment_id: 20)
tenant_four = Tenant.create(name: "Mike Nabil", age: 30, gender: "male", apartment_id: 21)
tenant_five = Tenant.create(name: "Mark Alton", age: 22, gender: "male", apartment_id: 21)
tenant_six = Tenant.create(name: "Christina White", age: 40, gender: "female", apartment_id: 21)
tenant_seven = Tenant.create(name: "Mary Brown", age: 28, gender: "female", apartment_id: 22)
tenant_eight = Tenant.create(name: "Snow White", age: 50, gender: "female", apartment_id: 22)
tenant_nine = Tenant.create(name: "Arther Black", age: 25, gender: "male", apartment_id: 22)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by("name = 'Kristin Wisoky'")
kristin.update("age" => 24)
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by("address = '62897 Verna Walk'")
verna.update("num_beds" => 3)
verna.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update("monthly_rent" => 2800)
verna.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = []
millenial = Tenant.where("age < 30")
millenial.all.each do |person|
  millenials << person
end
Tenant.destroy(millenials)
