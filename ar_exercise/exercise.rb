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
older_tenant = Tenant.where("age > ?" , 65)
# get all apartments whose price is greater than $2300
expensive = Apartment.where("price > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_corners.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "#{tenant.name} #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address} #{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_by(address, tenants)
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
# CREATE TABLE apartments(
#   id SERIAL PRIMARY KEY,
#   address TEXT,
#   monthly_rent INT,
#   sqft INT,
#   num_beds INT,
#   num_baths INT
# );

apartment1 = Apartment.new("1234 Sesame St", 700, 1600, 3, 2)
apartment1.save
apartment2 = Apartment.new("3456 New Ln", 500, 1000, 1, 1)
apartment2.save
apartment3 = Apartment.new("9876 Renew Rd", 900, 2200, 3, 2)
apartment2.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
# CREATE TABLE apartments(
#   id SERIAL PRIMARY KEY,
#   address TEXT,
#   monthly_rent INT,
#   sqft INT,
#   num_beds INT,
#   num_baths INT
# );

tenant1 = Tenant.create(id: "21", address: "7563 Newspaper Ln", monthly_rent: 2300, sqft: 1200 , num_beds: 3 , num_baths: 2)
tenant2 = Tenant.create(id: "22", address: "9000 Black St", monthly_rent: 1400, sqft: 700, num_beds: 1, num_baths: 1)
tenant3 = Tenant.create(id: "23", address: "1600 Waverly Pl", monthly_rent: 2000, sqft: 900, num_beds: 2, num_baths: 2)
tenant4 = Tenant.create(id: "23", address: "1600 Waverly Pl", monthly_rent: 2000, sqft: 900, num_beds: 2, num_baths: 2)
tenant5 = Tenant.create(id: "21", address: "7563 Newspaper Ln", monthly_rent: 2300, sqft: 1200, num_beds: 3, num_baths: 2)
tenant6 = Tenant.create(id: "24", address: "2039 Whatever St", monthly_rent: 1800, sqft: 750, num_beds: 2, num_baths: 1)
tenant7 = Tenant.create(id: "21", address: "7563 Newspaper Ln", monthly_rent: 2300, sqft: 1200, num_beds: 3, num_baths: 2)
tenant8 = Tenant.create(id: "25", address: "8594 Shoe Pl", monthly_rent: 2300, sqft: 1100, num_beds: 2, num_baths: 1)
tenant9 = Tenant.create(id: "24", address: "2039 Whatever St", monthly_rent: 1800, sqft: 750, num_beds: 2, num_baths: 1)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin_wisoky = Tenant.where("name == Kristin Wisoky")
kristin_wisoky.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.update(monthly_rent: 300)


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenial_eviction = Tenant.where(age < 30)
millenial_eviction.destroy_all
