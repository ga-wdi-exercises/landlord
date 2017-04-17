a### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
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
 id: 1, name: "Maudie Mosciski", age: 90, gender: "Female", apartment_id: 1>
# get all tenants older than 65
Tenant.where("age > 65") 
# get all apartments whose price is greater than $2300
Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damien = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
damien.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each {|tenant| puts "#{tenant.name} and #{tenant.id}"}
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each {|apt|
  puts "ADDRESS: #{apt.address}  RENT: #{apt.monthly_rent}"}

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt_one = Apartment.create(address: "2301 Freetown ct", monthly_rent: 1550, sqft: 844, num_beds: 2, num_baths: 2)
apt_one.save

apt_one = Apartment.create(address: "123 Main St", monthly_rent: 900, sqft: 844, num_beds: 7, num_baths: 8)
apt_two.save

apt_one = Apartment.create(address: "124 Ammar st", monthly_rent: 1600, sqft: 844, num_beds: 2, num_baths: 1)
apt_three.save
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
nine_new = Tenant.create([
	{name: "Ammar", age: "29", gender: "Male", apartment_id: 14},
	{name: "Jordan", age: "26", gender: "Male", apartment_id: 16},
	{name: "John", age: "26", gender: "Male", apartment_id: 19},
	{name: "Jimbo", age: "2", gender: "Male", apartment_id: 16},
	{name: "Frank", age: "29", gender: "Male", apartment_id: 18},
	{name: "Peter Griffin", age: "23", gender: "Male", apartment_id: 10},
	{name: "Eric Cartman", age: "24", gender: "Male", apartment_id: 50}
])

nine_new.save
	

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin = Tenant.find_by(name: 'Kristin Wisoky')
kristin.age = 24
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
vw = Apartment.find_by(address: "62897 Verna Walk")
vw.num_beds = 3
vw.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
	vw.monthly_rent += 400
	vw.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

get_the_hell_out = Tenant.where("age < 30")
get_the_hell_out.destroy
