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
old_tentants = Tenant.where('age > 65')
# get all apartments whose price is greater than $2300
pricey_apt = Apartment.where('monthly_rent > 2300')
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_tenants = Apartment.find_by(address: "6005 Damien Corners").tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
apt_id = Tenant.all.each do |tenant|
  puts "#{tenant.name} #{tenant.id.to_s}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
apt_dets = Apartment.all.each do |apartment|
  puts "#{apartment.address} #{apartment.id.to_s}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# evalai.dc [6:23 PM]
Apartment.all.each do |apartment|
               house_tenants = Tenant.select{|tenant| tenant[:apartment_id] == apartment[:id]}
               puts apartment.address
               puts house_tenants
            end
################################################
# CREATING / UPDATING / DELETING
################################################
# id SERIAL PRIMARY KEY,
# name VARCHAR,
# age INTEGER,
# gender VARCHAR,
# apartment_id INTEGER
# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
fieldhouse1 = Apartment.create!(address: "098 bib dr", monthly_rent: "9", sqft: "8x10", num_beds: "5", num_baths: "10")
fieldhouse2 = Apartment.create!(address: "099 bib dr", monthly_rent: "9", sqft: "8x10", num_beds: "5", num_baths: "10")
fieldhouse3 = Apartment.create!(address: "100 bib dr", monthly_rent: "9", sqft: "8x10", num_beds: "5", num_baths: "10")

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
jose = Tenant.create!(name: "Jose Andres", age: "40", gender: "M",apartment_id: "5" )
andre = Tenant.create!(name: "Andre Andres", age: "40", gender: "M",apartment_id: "5" )
sammy = Tenant.create!(name: "Sammy Andres", age: "40", gender: "M",apartment_id: "5" )
ashley = Tenant.create!(name: "Ashley Andres", age: "40", gender: "M",apartment_id: "5" )
john= Tenant.create!(name: "John Andres", age: "40", gender: "M",apartment_id: "5" )
casey = Tenant.create!(name: "Casey Andres", age: "40", gender: "M",apartment_id: "5" )
clara = Tenant.create!(name: "Clara Andres", age: "40", gender: "M",apartment_id: "5" )
josh = Tenant.create!(name: "Josh Andres", age: "40", gender: "M",apartment_id: "5" )
kobe = Tenant.create!(name: "Kobe Andres", age: "40", gender: "M",apartment_id: "5" )

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
