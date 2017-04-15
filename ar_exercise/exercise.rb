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
tenants_over_65 = Tenant.where("age > '65'")

# get all apartments whose price is greater than $2300
apartments_rent_over_2300 = Apartment.where("monthly_rent > '2300'")

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by address: "6005 Damien Corners"

# get all tenants in that apartment
damien_corners_residents = Tenant.find_by apartment_id: damien_corners.id

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each { |item| puts "#{item.name} === #{item.id}" }

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each { |item| puts "#{item.address} ++++ #{item.monthly_rent}"}

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |item|
  puts "========= #{item.address} =========================="
  all_tenants.each do |tenant|
    puts tenant.name if tenant.apartment_id == item.id
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "2342 Blah St",monthly_rent: 8000,sqft: 450,num_beds: 2,num_baths: 1)
apt2 = Apartment.create(address: "643 Dingus Rd.",monthly_rent: 2341,sqft: 1000,num_beds: 2,num_baths: 2)
apt3 = Apartment.create(address: "Jabroni Drive",monthly_rent: 450,sqft: 750,num_beds: 1,num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
bill = Tenant.create(name: "Bill Cunningham",age: 89,gender: "Male",apartment_id: 4)
james = Tenant.create(name: "James Rick",age: 10,gender: "Male",apartment_id: 6)
carol = Tenant.create(name: "Carol Carolson",age: 45,gender: "Female",apartment_id: 3)
bobby = Tenant.create(name: "Bobby Robert Jr.",age: 34,gender: "Male",apartment_id: 7)
wil = Tenant.create(name: "Wil Liem",age: 24,gender: "Male",apartment_id: 8)
gene = Tenant.create(name: "Gene Hamburger",age: 12,gender: "Male",apartment_id: 1)
quinn = Tenant.create(name: "Quinn Ton",age: 42,gender: "Male",apartment_id: 8)
liz = Tenant.create(name: "Lizzy Izzard",age: 26,gender: "Female",apartment_id: 1)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: 'Kristin Wisoky')
kristen.age = 22
kristen.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.num_beds += 1
verna.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.monthly_rent += 400
verna.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.where("age < '30'").delete_all

binding.pry
