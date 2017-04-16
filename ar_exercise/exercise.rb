### Make sure you've loaded the seeds.sql file into your DB before starting
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
#### DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all
# get the first tenant in the DB
frist_tenant = Tenant.first
# get all tenants older than 65
tenants_older_than_65 = Tenant.where "age >65"
# get all apartments whose price is greater than $2300
over_2300_apt = Apartment.where "monthly_rent > 2300"
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by address: '6005 Damien Corners'
# get all tenants in that apartment
damien_corners_tenants = Tenant.where apartment_id: damien_corners.id
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |tenant|
  puts tenant.id, tenant.name
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |apartment|
  puts apartment.address, apartment.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_each do |apartment|
  Tenant.find_each do |tenant|
    if apartment.id == tenant.apartment_id
      puts apartment.address, tenant.name
    end
  end
end
#I was not able to figure out how to combine all the tenants who live in the same apartment together..
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "new address1", monthly_rent: "2000", sqft: "700", num_beds: "3", num_baths: "2")
Apartment.create(address: "new address2", monthly_rent: "200", sqft: "1700", num_beds: "3", num_baths: "2")
Apartment.create(address: "new address3", monthly_rent: "4200", sqft: "3700", num_beds: "4", num_baths: "3")
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "John Smith", age: "20", gender: "Male", apartment_id: "21")
Tenant.create(name: "Sam Herd", age: "40", gender: "Male", apartment_id: "21")
Tenant.create(name: "Angie", age: "30", gender: "Female", apartment_id: "21")
Tenant.create(name: "Paul Kim", age: "50", gender: "male", apartment_id: "22")
Tenant.create(name: "Christina", age: "10", gender: "Female", apartment_id: "22")
Tenant.create(name: "Rose", age: "40", gender: "Female", apartment_id: "22")
Tenant.create(name: "Susie", age: "52", gender: "Female", apartment_id: "20")
Tenant.create(name: "Mark", age: "49", gender: "Male", apartment_id: "20")
Tenant.create(name: "Abe", age: "20", gender: "male", apartment_id: "20")

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by name: "Kristin Wisoky"
kristin.age += 1
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

apt_62897 = Apartment.find_by address: "62897 Verna Walk"
apt_62897.num_beds += 1
apt_62897.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

apt_62897.monthly_rent += 400
apt_62897.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
tenants_under_30 = Tenant.where "age < 30"
Tenant.delete(tenants_under_30)


binding.pry

puts "end of application"
