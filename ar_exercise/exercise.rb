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
old = Tenants.where('age' > 65)
# get all apartments whose price is greater than $2300
pricey = Apartments.where('monthly_rent'>2300)
# get the apartment with the address "6005 Damien Corners"
corners = Apartments.find_by(address: '6005 Damien Corners')
# get all tenants in that apartment
corners_tenants = corners.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all each{|tenant| puts "#{tenant.id}: #{tenant.name}"}
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all each do |apartment|
  puts "#{apartment.address}: $#{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "Tenants at #{apartment.address}:"
  apartment.tenants.each do |tenant|
    puts "  #{tenant.name}"
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(
address: "123 Main St Apt 1",
monthly_rent: 1000,
sqft: 800,
num_beds: 1,
num_baths: 5,
)
Apartment.create(
address: "123 Main St Apt 2",
monthly_rent: 1000,
sqft: 800,
num_beds: 1,
num_baths: 5,
)
Apartment.create(
address: "123 Main St Apt 3",
monthly_rent: 1000,
sqft: 800,
num_beds: 1,
num_baths: 5,
)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(
name: "Clark Kent",
age: 40,
gender: "Male",
apartment_id: 40
)
Tenant.create(
name: "Peter Parker",
age: 25,
gender: "Male",
apartment_id: 41
)
Tenant.create(
name: "Bruce Wayne",
age: 45,
gender: "Male",
apartment_id: 42
)
Tenant.create(
name: "Hal Jordan",
age: 35,
gender: "Male",
apartment_id: 43
)
Tenant.create(
name: "Tony Stark",
age: 45,
gender: "Male",
apartment_id: 44
)
Tenant.create(
name: "Diana Prince",
age: 33,
gender: "Female",
apartment_id: 45
)
Tenant.create(
name: "Barry Allen",
age: 29,
gender: "Male",
apartment_id: 46
)
Tenant.create(
name: "Barbara Gordon",
age: 19,
gender: "Female",
apartment_id: 47
)
Tenant.create(
name: "Dick Grayson",
age: 22,
gender: "Male",
apartment_id: 47
)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.age += 1
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.num_beds += 1
verna.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.monthly_rent += 400
verna.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where('age' < 30)
millenials.each destroy{|millenial| millenial.destroy} 
