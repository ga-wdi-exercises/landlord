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
tenants_over_65 = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
apartments_over_2300 = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
tenants_of_damien_corners = Tenant.where(apartment_id: damien_corners.id)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
# name_and_id = all_tenants.each do |tenant|
#   puts "Name: #{tenant.name}, ID: #{tenant.id}"
# end
# Iterate over each apartment, for each apartment, display it's address and rent price
# all_apartments = Apartment.all
# address_and_rent = all_apartments.each do |apartment|
#   puts "Address: #{apartment.address}, Rent: $#{apartment.monthly_rent}"
# end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# all_apartments.each do |apartment|
#   puts apartment.address
#   puts Tenant.where(apartment_id: apartment.id)
# end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "403 Mansion Lake", monthly_rent: 12000, sqft: 7300, num_beds: 10, num_baths: 16)
Apartment.create(address: "22 Sesame Street", monthly_rent: 480, sqft: 890, num_beds: 3, num_baths: 2)
Apartment.create(address: "851 Gingerbread Lane", monthly_rent: 970, sqft: 1450, num_beds: 4, num_baths: 4)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Elmo", age: 29, gender: "Male", apartment_id: 21)
Tenant.create(name: "Cookie Monster", age: 15, gender: "Male", apartment_id: 21)
Tenant.create(name: "Gingerbread Man", age: 49, gender: "Male", apartment_id: 22)
Tenant.create(name: "Mary Poppins", age: 30, gender: "Female", apartment_id: 6)
Tenant.create(name: "Will Hawkins", age: 25, gender: "Male", apartment_id: 20)
Tenant.create(name: "Isaac Duarte", age: 24, gender: "Male", apartment_id: 20)
Tenant.create(name: "Spiderman", age: 50, gender: "Male", apartment_id: 10)
Tenant.create(name: "Silly Sally", age: 19, gender: "Female", apartment_id: 9)
Tenant.create(name: "Priscilla Bean", age: 42, gender: "Female", apartment_id: 14)
Tenant.create(name: "Willy Wonka", age: 55, gender: "Male", apartment_id: 18)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_beds: 3)
#update or save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.where("age < 30").destroy_all

binding.pry
