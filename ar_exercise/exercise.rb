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
all_apartments = Apartment.all

# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
older_tenants = Tenant.where("age > '65'")

# get all apartments whose price is greater than $2300
expensive_apts = Apartment.where("monthly_rent > '2300'")

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.where("address = '6005 Damien Corners'")

# get all tenants in that apartment
damien_corners = Apartment.where("address = '6005 Damien Corners'")[0].tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts tenant[:name], tenant[:id]
end

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments.each do |apartment|
  puts apartment[:address], apartment[:monthly_rent]
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apartment|
  all_tenants.each do |tenant|
    if apartment[:id] == tenant[:apartment_id]
      puts "#{apartment[:address]}  #{tenant[:name]}"
    end
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
morella = Apartment.new(address:'5524 Morella Ave.', monthly_rent:1200, sqft:900, num_beds:1, num_baths:1)
margate = Apartment.new(address:'11691 Margate St.', monthly_rent:1750, sqft:1000, num_beds:2, num_baths:1)
simmons = Apartment.new(address:'1603 Simmons Dr.', monthly_rent:5500, sqft:4000, num_beds:4, num_baths:4)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
jordan = Tenant.new(name: "Jordan Ballard", age: 31, gender: "Male", apartment_id: 22)
daniel = Tenant.new(name: "Daniel Ballard", age: 37, gender: "Male", apartment_id: 21)
michael = Tenant.new(name: "Michael Ballard", age: 30, gender: "Male", apartment_id: 21)
andrea = Tenant.new(name: "Andrea Sharp", age: 35, gender: "Female", apartment_id: 23)
samantha = Tenant.new(name: "Samantha Ballard", age: 32, gender: "Female", apartment_id: 22)
campbell = Tenant.new(name: "Campbell Ballard", age: 4, gender: "Male", apartment_id: 22)
david = Tenant.new(name: "David Ballard", age: 59, gender: "Male", apartment_id: 23)
pam = Tenant.new(name: "Pam Ballard", age: 60, gender: "Female", apartment_id: 23)
carly = Tenant.new(name: "Carly Ballard", age: 24, gender: "Female", apartment_id: 21)

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
