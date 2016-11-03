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
old_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
expensive_apts = Tenant.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
apt_address = Tenant.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
all_tenants = apt_address.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
every_tenant = Tenant.all
every_tenant.each do |tenant|
  puts "#{tenant.name}, #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
every_apartment = Apartment.all
every_apartment.each do |apartment|
  puts "Address:#{apartment.address}, Price:$#{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
every_apartment = Apartment.all
every_apartment.each do |apartment|
  puts "#{apartment.address}"
  display_tenants = Tenant.select {|tenant| tenant.[:apartment_id] == apartment.[:id]}
    display_tenants.each do |tenant|
      puts "#{tenant.name}"
    end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
new_apt1 = Apartment.create(Address: "123 Fake Street", monthly_rent: 999, sqft: 400, num_beds: 1, num_baths: 2)
new_apt2 = Apartment.create(Address: "124 Fake Street", monthly_rent: 998, sqft: 600, num_beds: 11, num_baths: 2)
new_apt3 = Apartment.create(Address: "125 Fake Street", monthly_rent: 997, sqft: 500, num_beds: 1, num_baths: 22)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
new_tenant1 = Tenant.create(name: "Ba", age: 99, gender: "male", apartment_id: 1)
new_tenant2 = Tenant.create(name: "Ta", age: 99, gender: "female", apartment_id: 2)
new_tenant3 = Tenant.create(name: "Ra", age: 99, gender: "male", apartment_id: 3)
new_tenant4 = Tenant.create(name: "Na", age: 99, gender: "female", apartment_id: 4)
new_tenant5 = Tenant.create(name: "Pa", age: 99, gender: "male", apartment_id: 5)
new_tenant6 = Tenant.create(name: "Ka", age: 99, gender: "male", apartment_id: 6)
new_tenant7 = Tenant.create(name: "Wa", age: 99, gender: "female", apartment_id: 7)
new_tenant8 = Tenant.create(name: "Qa", age: 99, gender: "male", apartment_id: 8)
new_tenant9 = Tenant.create(name: "Za", age: 99, gender: "male", apartment_id: 9)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Kristin = Tenant.find_by(name: "Kristin Wisoky")
Kristin.age += 1
Kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
find_apartment = Apartment.find_by(address: "62897 Verna Walk")
find_apartment.num_beds += 1
find_apartment.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
find_apartment.monthly_rent += 400
find_apartment.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
young_tenants = Tenant.where("age < 30")
# Delete their records from the DB
young_tenants.destroy
