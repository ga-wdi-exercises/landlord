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
old_tenants = Tenant.where "age > 65"

# get all apartments whose price is greater than $2300
high_price = Apartment.where "monthly_rent > 2300"

# get the apartment with the address "6005 Damien Corners"
specific_apt = Apartment.find_by(address:'6005 Damien Corners')
# get all tenants in that apartment
Tenant.where "apartment_id: 6"

############# WOULD LIKE HELP WITH THE BELOW #####################

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
name_id = tenants.each do|tenant|
puts name_id.all
end

# Iterate over each apartment, for each apartment, display it's address and rent price
add_rp = apartments.each do |apartments|
puts add_rp.

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "36 Chambers Way", monthly_rent: 800, sqft: 1994, num_beds: 2, num_baths: 2)
apt2 = Apartment.create(address: "1994 Brooklyn Zoo", monthly_rent: 850, sqft: 1998, num_beds: 3, num_baths: 2)
apt3 = Apartment.create(address: "8 Diagrams Plaza", monthly_rent: 900, sqft: 2000, num_beds: 4, num_baths: 3)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
tenant1 = Tenant.create(name: "RZA", age:32, gender:"Male", apartment_id:21)
tenant2 = Tenant.create(name: "GZA", age:34, gender:"Male", apartment_id:21)
tenant3 = Tenant.create(name: "Ol' Dirty Bastard", age:50, gender:"Male", apartment_id:21)
tenant4 = Tenant.create(name: "Inspecktah Deck", age:36, gender:"Male", apartment_id:22)
tenant5 = Tenant.create(name: "Raekwon", age:37, gender:"Male", apartment_id:22)
tenant6 = Tenant.create(name: "U-God", age:38, gender:"Male", apartment_id:22)
tenant7 = Tenant.create(name: "Ghostface Killah", age:39, gender:"Male", apartment_id:23)
tenant8 = Tenant.create(name: "Method Man", age:41, gender:"Male", apartment_id:23)
tenant9 = Tenant.create(name: "Masta Killa", age:42, gender:"Male", apartment_id:23)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name:'Kristin Wisoky')
kristin.update(age:24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
renovate = Apartment.find_by(address:'62897 Verna Walk')
renovate.update(num_beds:3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
rentAdjust = renovate.update(monthly_rent:2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

yuppies = Tenant.where "age < 30"
yuppies.destroy
######## CLI WILL NOT LET ME DESTROY THESE YUPPIES! WHAT GIVES? ###########
