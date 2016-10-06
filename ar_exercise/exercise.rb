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
tenants_over_65 = Tenant.where "age > 65"

# get all apartments whose price is greater than $2300
apts_over_2300 = Apartment.where "monthly_rent > 2300"

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.where "address = '6005 Damien Corners'"

# get all tenants in that apartment
damien_corners_tenants = damien_corners[0].tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
	# puts tenant.name, tenant.id
end

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apt|
	# puts apt.address, apt.monthly_rent
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apt|
	# p apt.address, apt.tenants
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
# apt1 = Apartment.create address: 'woo', monthly_rent: 100, sqft: 111, num_beds: 1, num_baths: 1
# apt2 = Apartment.create address: 'woo woo', monthly_rent: 200, sqft: 222, num_beds: 2, num_baths: 2
# apt3 = Apartment.create address: 'woo woo woo', monthly_rent: 300, sqft: 333, num_beds: 3, num_baths: 3

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# ten1 = Tenant.create name: 'Tim', age: 1, apartment_id: 1
# ten2 = Tenant.create name: 'Nick', age: 2, apartment_id: 1
# ten3 = Tenant.create name: 'Alex', age: 3, apartment_id: 2
# ten4 = Tenant.create name: 'Barret', age: 4, apartment_id: 2
# ten5 = Tenant.create name: 'Jesse', age: 5, apartment_id: 2
# ten6 = Tenant.create name: 'Liza', age: 6, apartment_id: 3
# ten7 = Tenant.create name: 'Mike', age: 7, apartment_id: 3
# ten8 = Tenant.create name: 'Adrian', age: 8, apartment_id: 3
# ten9 = Tenant.create name: 'Kevin', age: 9, apartment_id: 3

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristen = Tenant.where "name = 'Kristin Wisoky'"
# kristen[0].age += 1

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# verna_walk = Apartment.find_by address: "62897 Verna Walk"
# verna_walk.num_beds += 1
# verna_walk.update num_beds: 2

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# verna_walk.update monthly_rent: 2800

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# under_30 = Tenant.where "age < 30"
# under_30.each do |tenant|
# 	tenant.destroy
# end

binding.pry
puts 'done'
