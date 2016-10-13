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

binding.pry
puts "done"

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
older_65 = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
apt_greater_2300 = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
apt_damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
apt_damien_corners_tenants = apt_damien_corners.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "here is #{tenant.name} and their id, #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apt|
  puts "here is the apartment address, #{apt.address}, and its rent, #{apt.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apt|
  tenants = apt.tenants.map { |ten| ten.name}
  puts "here is the apartment address, #{apt.address}, and its tenants are: #{tenants.join(", ")}"
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "1260 Millerwood Dr", monthly_rent: 1400, sqft: 1300, num_beds: 4, num_baths: 4)
Apartment.create(address: "10 Frankfurt Rd", monthly_rent: 800, sqft: 300, num_beds: 2, num_baths: 3)
Apartment.create(address: "432 Assembly Ct", monthly_rent: 1600, sqft: 1000, num_beds: 6, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Trini Power", age: 32, gender: "Female", apartment_id: 4)
Tenant.create(name: "Kimberly Power", age: 28, gender: "Female", apartment_id: 4)
Tenant.create(name: "Zack Power", age: 30, gender: "Male", apartment_id: 4)
Tenant.create(name: "Jason Power", age: 33, gender: "Male", apartment_id: 4)
Tenant.create(name: "Billy Power", age: 37, gender: "Male", apartment_id: 4)
Tenant.create(name: "Rafael Power", age: 13, gender: "Male", apartment_id: 10)
Tenant.create(name: "Leonardo Power", age: 12, gender: "Male", apartment_id: 2)
Tenant.create(name: "Michaelangelo Power", age: 14, gender: "Male", apartment_id: 1)
Tenant.create(name: "Donatello Power", age: 15, gender: "Male", apartment_id: 5)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: "24")
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.update(num_beds: "3")
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: 2800)
# Millenial Eviction!
# Find all tenants who are under 30 years old
under_30 = Tenant.where("age < 30")
# Delete their records from the DB
under_30.destroy_all

binding.pry
puts "done"
