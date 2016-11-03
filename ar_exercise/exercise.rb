### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

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
# get all tenants older than 65
# get all apartments whose price is greater than $2300
# get the apartment with the address "6005 Damien Corners"
# get all tenants in that apartment
first_tenant = Tenant.first_tenant
older_tenant = Tenant.where ("age > 65")
monthly_rent = Apartment.where("rent > 2300")
apt = Apartment.find_by(address: "6005 Damien Corners")
apt_tenants = apt_tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# Iterate over each apartment, for each apartment, display it's address and rent price
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_tenants.each do |tenant|
  puts "#{tenant.id}: #{tenant.name}"
end

all_apt = Apartment.all
all_apt.each do |apt|
  puts "#{apt.address}"
  puts "#{apt.monthly_rent}"
end

all_apt.each do |apt|
  puts "#{apt.address}"
  puts "#{apt.tenants.map {|tenant| tenant.name}.join(", ")}"
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Apartment.create(address:"6910 green drive", monthly_rent: 2900, sqft: 600, num_beds: 2,num_bath:1)
Apartment.create(address:"1900 red drive", monthly_rent: 3100, sqft: 600, num_beds: 1,num_bath:2)
Apartment.create(address:"1100 blue drive", monthly_rent: 2999, sqft: 600, num_beds: 2,num_bath:1)

Tenant.create(name: "Bob", age: 25, gender: "male", apartment_id: 1);
Tenant.create(name: "James", age: 25, gender: "male", apartment_id: 2);
Tenant.create(name: "Clint", age: 27, gender: "male", apartment_id: 3);
Tenant.create(name: "Amy", age: 17, gender: "female", apartment_id: 1);
Tenant.create(name: "Cindy", age: 27, gender: "female", apartment_id: 2);
Tenant.create(name: "Bill", age: 22, gender: "male", apartment_id: 3);
Tenant.create(name: "Diana", age: 25, gender: "female", apartment_id: 1);
Tenant.create(name: "Forrest", age: 26, gender: "male", apartment_id: 2);
Tenant.create(name: "Blob", age: 20, gender: "male", apartment_id: 3);


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Kristin = Tenant.find_by(name: "Kristin Wisoky")
Kristin.age += 1
Kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
apt = Apartment.find_by(address: "62897 Verna Walk")
apt.num_beds += 1
apt.save
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
apt.monthly_rent += 400
apt.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
under_30 = Tenant.where("age < 30")
# Delete their records from the DB
under_30.destroy_all
