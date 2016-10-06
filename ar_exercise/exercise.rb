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
older_than_65 = Tenant.where("age > ? ", 65 )


# get all apartments whose price is greater than $2300c
rent_over_2300 = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_corners_tenants = damien_corners.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
name_id = Tenant.all.each do |tenant|
  " #{tenant.name} with id #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
add_rent = Apartment.all.each do |apartment|
  puts "#{apartment.address} apartment.monthly_rent"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apt_and_owner = Apartment.all.each do |apartment|
  puts apartment.address, apartment.tenants.map{|t| "#{t.id}:#{t.name}"}
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
nemo = Apartment.new(address: = "Wallaby Way", monthly_rent: = 1, sqft: = 1000, num_beds:=2, num_baths:=1)
holmes = Apartment.new(address: = "Baket St", monthly_rent: = 2, sqft: = 1500, num_beds:=1, num_baths:=2)
monks = Apartment.new(address: = "nyc", monthly_rent: = 1, sqft: = 1000, num_beds:=2, num_baths:=1 )

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
shark_bait = Tenant.new(:name = "Shark Bait", :age = 2, :gender = "Male", :apartment_id = 1)
starfish = Tenant.new(:name = "Shark Bait", :age = 2, :gender = "Male", :apartment_id = 1)
girl = Tenant.new(:name = "Shark Bait", :age = 2, :gender = "Male", :apartment_id = 1)


sherlock = Tenant.new(:name = "Sherlock Holmes", :age = 35, :gender = "Male", :apartment_id = 2)
watson = Tenant.new(:name = "John Watson", :age = 30, :gender = "Male", :apartment_id = 2)
ms = Tenant.new(:name = "Ms...", :age = 65, :gender = "Female", :apartment_id = 2)

jerry = Tenant.new(:name = "Jerry Seinfeld", :age = 2, :gender = "Male", :apartment_id = 1)
geroge = Tenant.new(:name = "George Costanza", :age = 2, :gender = "Male", :apartment_id = 1)
kramer = Tenant.new(:name = "Cosmo Kramer", :age = 2, :gender = "Male", :apartment_id = 1)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older

# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
binding.pry
puts "hi"
