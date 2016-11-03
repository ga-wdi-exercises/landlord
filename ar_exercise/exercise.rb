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
old_tenant = Tenant.where(tenant.age > 65)
# get all apartments whose price is greater than $2300
exp_apt = Apartment.where(apartment.monthly_rent > 2300)
# get the apartment with the address "6005 Damien Corners"
some_apt = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damientenants = Apartment.tenants.all
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenants.each |tenant| do
  puts "Tenants: #{tenant.name} ID: #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartments.each |apartment| do
  puts "Address: #{apartment.address} Price: #{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartments.each |apartment| do
  puts "Address: #{apartment.address} Tenants: #{apartment.tenants.all}"
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.new("4905 16th Rd")
Apartment.new("873 Grover St")
Apartment.new("982 Bloomer Ave")
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Dan Feely", apartment_id: )
Tenant.create(name: "Will Yokes", apartment_id: )
Tenant.create(name: "Grant Plom", apartment_id: )
Tenant.create(name: "Haley Forst", apartment_id: )
Tenant.create(name: "Emily Sonnet", apartment_id: )

Tenant.create(name: "Phil Jones", apartment_id: )
Tenant.create(name: "Kris Lear", apartment_id: )
Tenant.create(name: "Paulina Ursa", apartment_id: )
Tenant.create(name: "Earl Sweater", apartment_id: )
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
 tenant = Tenant.find_by(name: "Kristin Wisoky")
 tenant.update(age: 23)


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
apartment = Apartment.find_by(address: "62897 Verna Walk")
apartment.update( num_beds: num_beds+=1 )

# Rent Adjustment!
# Update the same apartment that you just 'renovated'. Increase it's rent by $400
# to reflect the new bedroom
apartment.update( monthly_rent: monthly_rent+=400 )

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
youngins = Tenant.where(age < 30)
youngins.destroy_all
