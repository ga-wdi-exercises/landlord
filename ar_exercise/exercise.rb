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
binding.pry
# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
older_tenants = Tenant.where("age >=65")

# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where("monthly_rent >= 2300")

# get the apartment with the address "6005 Damien Corners"
damiens_corners = Apartment.find_by(:address => "6005 Damien Corners")

# get all tenants in that apartment
tenants_of_damiens_corners = damien_corners.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants = Tenant.all
all_tenants.each do |tenant|
  puts "#{tenant.name} | ID# #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apartment|
  puts "#{apartment.address} | $#{apartment.monthly_rent.to_s} per month"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

mich_house = Apartment.create(address: "1227 Michigan Pass", monthly_rent: 3500, sqft: 2300, num_beds:6, num_baths:4)
gardener_st = Apartment.create(address: "73 Gardener Avenue" monthly_rent: 2000, sqft: 1800, num_beds:3, num_baths:3)
beacon_lane = Apartment.create(address: "4000 Beacon Lane" monthly_rent: 2500, sqft: 1500, num_beds:2, num_baths:1)

mathew = Tenant.create(name: "Mathew	Cross", age:19, gender:"Male", apartment:beacon_lane)
joella = Tenant.create(name: "Joella	Salter", age:24, gender:"Female", apartment:gardener_st)
malcolm = Tenant.create(name: "Malcolm	Bryant" age: 45, gender: "Male", apartment: mich_house)
erin = Tenant.create(name: "Erin	Patrick", age: 31, gender:"Female", apartment: mich_house)
jeremiah = Tenant.create(name: "Jeremiah	Malone" age: 90, gender: "Male", apartment: mich_house)
claudia = Tenant.create(name: "Claudia	Howell", age: 30, gender: "Female", apartment: gardener_st)
damon = Tenant.create(name: "Damon	Fisher", age: 20, gender: "Male", apartment: beacon_lane)
holly = Tenant.create(name: "Holly	Fields", age: 34, gender: "Female", apartment: mich_house)
rufus = Tenant.create(name: "Rufus	Dunn", age: 55, gender: "Male" apartment: mich_house)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_baths: 4)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.update(monthly_rent:2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenants.find_by("age =< 30")
millenials.destroy
