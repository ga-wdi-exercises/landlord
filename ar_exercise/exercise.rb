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

# binding.pry
################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all
#
# # get the first tenant in the DB
first_tenant = Tenant.first
        #
# # get all tenants older than 65
tenant_older_65 = Tenant.where("age >= ?", 65)
#
# # get all apartments whose price is greater than $2300
expensive_apt = Apartment.where("monthly_rent >= ?", 2300)
#
# # get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.where(address: "6005 Damien Corners")
damien_corners = Apartment.find_by(:address => "6005 Damien Corners")
#

# get all tenants in that apartment
damien_corners = Apartment.find_by(:address => "6005 Damien Corners")
all_tenants_Damien_Corners = Apartment.where(""apartment_id == tenant)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |tenant|
  puts "Tenant name: #{tenant.name}, Tenant id: #{tenant.apartment_id}"  end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |apartment|
  puts "apartment address: #{apartment.address}, apartment rent: #{apartment.monthly_rent}" end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_each do |apartment|
  puts "apartment address: #{apartment.address}"
  apartment.tenants.find_each do |tenant|
  puts "tenants: #{tenant.name}" end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
the_den = Apartment.create(address: "12 Main Street", monthly_rent: 750, sqft: 1000, num_beds: 2, num_baths: 1),
the_dungeon = Apartment.create(address: "13 Main Street", monthly_rent: 850, sqft: 1200, num_beds: 3, num_baths: 2),
the_lair = Apartment.create(address: "14 Main Street", monthly_rent: 950, sqft: 1400, num_beds: 3, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
avery = Tenant.create(name: "Avery", age: 26, gender: "Female", apartment_id: 20),
bill = Tenant.create(name: "Bill", age: 62, gender: "Male", apartment_id: 20),
candice = Tenant.create(name: "Candice", age: 54, gender: "Female", apartment_id: 20),
dillan = Tenant.create(name: "Dillan", age: 33, gender: "Male", apartment_id: 21),
everett = Tenant.create(name: "Everett", age: 38, gender: "Male", apartment_id: 21),
fritz = Tenant.create(name: "Fritz", age: 40, gender: "Male", apartment_id: 21),
georgia = Tenant.create(name: "Georgia", age: 35, gender: "Female", apartment_id: 22),
happy = Tenant.create(name: "Happy", age: 32, gender: "Female", apartment_id: 22),
ivan = Tenant.create(name: "Ivan", age: 28, gender: "Male", apartment_id: 22)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
k_wisoky_bday = Tenant.find_by(name: "Kristin Wisoky")
k_wisoky_bday.increment(:age, 1)
k_wisoky_bday.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk_add_bed = Apartment.find_by(address: "62897 Verna Walk")
verna_walk_add_bed.update(:num_beds => '3')

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk_add_bed.increment(:monthly_rent, 400)
verna_walk_add_bed.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
tenants_under_30 = Tenant.where("age < ?", 30)
tenants_under_30.destroy_all

# Delete their records from the DB
