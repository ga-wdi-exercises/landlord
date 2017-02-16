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
tenant_1 = Tenant.find(1)
# get all tenants older than 65
tenant_older65 = Tenant.find_by(age: > 65)
# get all apartments whose price is greater than $2300
apt_price_is_over_2300 = Apartment.find_by(monthly_rent: 2300)
# get the apartment with the address "6005 Damien Corners"
specific_apt = Apartment.where(address: "6005 Damien Corners" )
# get all tenants in that apartment
all_tenants_in_apt = Tenants.where(apartment_id: 6)
apartment_tenants = Tenants.where(Apartments.id == Tenants.apartment_id)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "#{tenant.name}, #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address}, #{apartment.monthly_rent}"
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "#{apartment.address}, #{apartment.tenants}"

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
johnsons_apt = Aparment.create(address: "11111 Future Lane", monthly_rent: 3500, sqft: 2000, num_beds: 4, num_baths: 3)
wests_apt = Aparment.create(address: "22222 Where Court", monthly_rent: 5500, sqft: 2500, num_beds: 5, num_baths: 4)
laters_apt = Aparment.create(address: "33333 Food Blvd", monthly_rent: 2500, sqft: 1000, num_beds: 2, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

Tenant.create(name: "John Johnson", age: 55, gender: "male", apartment_id: 21)
Tenant.create(name: "Mildred Johnson", age: 53, gender: "female", apartment_id: 21)
Tenant.create(name: "Johnny Johnson", age: 8, gender: "male", apartment_id: 21)
Tenant.create(name: "Jimmy Johnson", age: 6, gender: "male", apartment_id: 21)
Tenant.create(name: "Kanye West", age: 35, gender: "male", apartment_id: 22)
Tenant.create(name: "Kim West", age: 32, gender: "female", apartment_id: 22)
Tenant.create(name: "North West", age: 4, gender: "female", apartment_id: 22)
Tenant.create(name: "Seeya Laters", age: 40, gender: "male", apartment_id: 23)
Tenant.create(name: "Catchya Laters", age: 45, gender: "female", apartment_id: 23)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin_wiosky = Tenant.find_by(name: "Kristin Wiosky")
kristin.update(age: 24)
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk_apt = Apartment.find_by(address: "62897 Verna Walk")
verna_walk_apt.update(num_beds: 4)
verna_walk_apt.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk_apt.update(monthly_rent: 2800)
verna_walk_apt.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
tenants_under30 = Tenant.where(age: < 30)
tenants_under30.destroy_all
