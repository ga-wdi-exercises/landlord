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
older = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
expensive = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
apt = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
apt_tnt = apt.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "#{tenant.id}: #{tenant.name}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apt = Apartment.all
all_apt.each do |apt|
  puts "#{apt.address}"
  puts "#{apt.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apt.each do |apt|
  puts "#{apt.address}"
  puts "#{apt.tenants.map {|tenant| tenant.name}.join(", ")}"
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "10217 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
Apartment.create(address: "10218 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
Apartment.create(address: "10219 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Jon", age: 27, gender: "male", apartment_id: 1);
Tenant.create(name: "Jon2", age: 27, gender: "male", apartment_id: 1);
Tenant.create(name: "Jon3", age: 27, gender: "male", apartment_id: 1);
Tenant.create(name: "Jon4", age: 27, gender: "male", apartment_id: 2);
Tenant.create(name: "Jon5", age: 27, gender: "male", apartment_id: 2);
Tenant.create(name: "Jon6", age: 27, gender: "male", apartment_id: 2);
Tenant.create(name: "Jon7", age: 27, gender: "male", apartment_id: 3);
Tenant.create(name: "Jon8", age: 27, gender: "male", apartment_id: 3);
Tenant.create(name: "Jon9", age: 27, gender: "male", apartment_id: 3);
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Kristin = Tenant.find_by(name: "Kristin Wisoky")
Kristin.age += 1
Kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
apt = Apartment.find_by(address: "62897 Verna Walk")
apt.num_beds += 1
apt.save
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
apt.monthly_rent += 400
apt.save
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
under_30 = Tenant.where("age < 30")
# Delete their records from the DB
under_30.destroy_all
