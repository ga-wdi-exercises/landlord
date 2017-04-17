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

older_tenants = Tenant.find_by("age > 65")


# get all apartments whose price is greater than $2300

expensive_apartments = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"

damien_corners = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment

damien_corners.tenants


# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "NAME: #{tenant.name} ID: #{tenant.id}"
end


# Iterate over each apartment, for each apartment, display it's address and rent price

Apartment.all.each do |apartment|
  puts "Address is #{apartment.address}.  Rent is #{apartment.monthly_rent} per month"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

Apartment.all.each do |apartment|
  puts "Address is #{apartment.address}."
  all_tenants.each do |tenant|
    if tenant.apartment_id == apartment.id
      puts tenant.name
    end
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

first_apt = Apartment.create(address: "1235 Fake St.", monthly_rent: 1500, sqft: 950, num_beds: 22, num_baths: 48)
first_apt.save

devil_apt = Apartment.create(address: "666 Devil's Ridge Rd.", monthly_rent: 666, sqft: 666, numb_beds: 666, num_baths: 0)
devil_apt.save

weird_apt = Apartment.create(address: "33 ZZyyzzk Rd.", monthly_rent: 200, sqft: 800, num_beds: 3, num_baths:4)
weird_apt.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
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
