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
all_tenants.find(1)
# get all tenants older than 65
Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
Apartment.find_by address: '6005 Damien Corners'
# get all tenants in that apartment
Tenant.find(Apartment.find_by(address: '6005 Damien Corners').id)
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |person| puts person.name, person.id end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apt| puts apt.address, apt.monthly_rent end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apt| puts apt.address
  Tenant.where(apartment_id: apt.id).find_each do |tnt|
    puts tnt.name
  end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "1234 Elm St", monthly_rent: 15, sqft: 2400, num_beds: 2, num_baths: 3)
Apartment.create(address: "500 Bou Le Vard St.", monthly_rent: 800, sqft: 2000, num_beds: 1, num_baths: 2)
Apartment.create(address: "400 Maple St.", monthly_rent: 800, sqft: 2000, num_beds: 3, num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Quinoa Jerreaux", age: 92, gender: "Male", apartment_id: 22)
Tenant.create(name: "Bennett Jerrow", age: 29, gender: "Male", apartment_id: 18)
Tenant.create(name: "Beau JaRow", age: 19, gender: "Male", apartment_id: 24)
Tenant.create(name: "Lucy Fur", age: 99, gender: "Female", apartment_id: 1)
Tenant.create(name: "Alexander Watts", age: 109, gender: "Female", apartment_id: 14)
Tenant.create(name: "Marie Anthony", age: 30, gender: "Female", apartment_id: 16)
Tenant.create(name: "Lizzie Tudor", age: 54, gender: "Female", apartment_id: 11)
Tenant.create(name: "Melissa Plantaganet", age: 41, gender: "Female", apartment_id: 7)
Tenant.create(name: "Henri Tudeur", age: 22, gender: "Male", apartment_id: 19)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky").age
kristin_age = Tenant.find_by(name: "Kristin Wisoky").age
kristin.update(age: kristin_age+1)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk_beds = verna_walk.num_beds
verna_walk.update(num_beds = verna_walk_beds+1)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk_rent = verna_walk.monthly_rent
verna_walk.update(monthly_rent = verna_walk_rent+400)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

millenials = []
Tenant.where("age < 30").find_each do |mill|
  millenials.push(mill.id)
end
Tenant.destroy(millenials)
