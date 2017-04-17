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
older_than_65 = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
greater_than_2300 = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
apartment_damien = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
apartment_damien.tenants


# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
    puts "NAME: #{tenant.name} ID: #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apt|
    puts "ADDRESS: #{apt.address} RENT: #{apt.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# Apartment.all.each do |apt|
#need help on this one



################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

apt_1 = Apartment.create(address: "111 general assembly", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
apt_1.save

apt_2 = Apartment.create(address: "222 general assembly", monthly_rent: 2000, sqft: 2000, num_beds: 2, num_baths: 2)
apt_2.save

apt_3 = Apartment.create(address: "333 general assembly", monthly_rent: 3000, sqft: 3000, num_beds: 3, num_baths: 3)
apt_3.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

ick = Tenant.create(name: "Ick", age: "26", gender: "Male", apartment_id: 23)
ick.save

kwon = Tenant.create(name: "Kwon", age: "27", gender: "Male", apartment_id: 22)
kwon.save

hyun = Tenant.create(name: "Hyun", age: "26", gender: "Male", apartment_id: 24)
hyun.save

john = Tenant.create(name: "John", age: "25", gender: "Male", apartment_id: 24)
john.save

andy = Tenant.create(name: "Andy", age: "35", gender: "Male", apartment_id: 24)
andy.save

jana = Tenant.create(name: "Jana", age: "26", gender: "Female", apartment_id: 21)
jana.save

marcus = Tenant.create(name: "Marcus", age: "29", gender: "Male", apartment_id: 21)
marcus.save

jeong = Tenant.create(name: "Jeong", age: "22", gender: "Female", apartment_id: 18)
jeong.save

juan = Tenant.create(name: "Juan", age: "22", gender: "Male", apartment_id: 17)
juan.save


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.age += 1
kristin.save


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.num_beds += 1
verna_walk.save


# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.monthly_rent += 400
verna_walk.save


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.where("age < 30").destroy_all


binding.pry
