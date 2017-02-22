

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
#: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
# all_tenants = Tenant.all

# get the first tenant in the DB
# first_tenant = Tenant.first
# get all tenants older than 65
# oldies = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
# penthouses = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
# damien_corners_apt = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
# damien_corners_apt.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# Tenant.all.each do |tenant|
#   puts "#{tenant.name}: #{tenant.id}"
# end
# Iterate over each apartment, for each apartment, display it's address and rent price
# Apartment.all.each do |apartment|
#   puts "#{apartment.address}, #{apartment.monthly_rent}"
# end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# Apartment.all.each do |apartment|
#   puts "#{apartment.address}, #{apartment.tenants.inspect}"
# end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# apt1 = Apartment.create(address: "666 Hades Lane",  monthly_rent: 666, sqft: 666, num_beds: 0, num_baths: 0)
# apt2 = Apartment.create(address: "111 Somewhere",  monthly_rent: 1099, sqft: 2000, num_beds: 5, num_baths: 1)
# apt3 = Apartment.create(address: "808 Kitteh Palace",  monthly_rent: 20, sqft: 1000, num_beds: 1, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# jan = Tenant.create(name: "Jan", age: 30, gender: "female", apartment_id: 21)
# stan = Tenant.create(name: "Stan", age: 40, gender: "male", apartment_id: 21)
# dan = Tenant.create(name: "Dan", age: 10, gender: "male", apartment_id: 21)
# deb = Tenant.create(name: "Deb", age: 50, gender: "female", apartment_id: 22)
# jeb = Tenant.create(name: "Jeb", age: 52, gender: "male", apartment_id: 22)
# zeb = Tenant.create(name: "Zeb", age: 43, gender: "male", apartment_id: 22)
# pat = Tenant.create(name: "Pat", age: 80, gender: "male", apartment_id: 23)
# kat = Tenant.create(name: "Kat", age: 87, gender: "female", apartment_id: 23)
# nat = Tenant.create(name: "Nat", age: 99, gender: "male", apartment_id: 23)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# verna_apartment = Apartment.find_by(address: "62897 Verna Walk")
# verna_apartment.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# verna_apartment.update(monthly_rent: 3000)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# Tenant.where("age > ?", 30).destroy_all
