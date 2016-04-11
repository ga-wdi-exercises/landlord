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

binding.pry

################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
first_tentant = Tenant.first
# get all tenants older than 65
seniors = Tenant.where("age > 65", :age)
# get all apartments whose price is greater than $2300
gucci_crubs = Apartment.where("monthly_rent > 2300", :monthly_rent)
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_corners_residents = Apartment.find_by(address: "6005 Damien Corners").tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "Name: #{tenant.name}, Id: #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "Address: #{apartment.address}, Rent: $#{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts apartment.address
  apartment.tenants.each do |tenant|
    puts tenant.name
  end
  puts "-" * 50
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
simpsons_house = Apartment.create(address: "742 Evergreen Terrace", montly_rent: 2400, sqft: 2000, num_beds: 4, num_baths: 2)
flanders_house = Apartment.create(address: "744ish Evergreen Terrace", montly_rent: 2600, sqft: 2000, num_beds: 4, num_baths: 2)
burns_manor = Apartment.create(address: "1000 Mammon Lane", montly_rent: 10000, sqft: 12000, num_beds: 10, num_baths: 6)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
simpsons_house.tenants.create(name: "Homer Simpson", age: 36, gender: "Male")
simpsons_house.tenants.create(name: "Marge Simpson", age: 34, gender: "Female")
simpsons_house.tenants.create(name: "Bart Simpson", age: 10, gender: "Male")
simpsons_house.tenants.create(name: "Lisa Simpson", age: 8, gender: "Female")
simpsons_house.tenants.create(name: "Maggie Simpson", age: 3, gender: "Female")
flanders_house.tenants.create(name: "Ned Flanders", age: 60, gender: "Male")
flanders_house.tenants.create(name: "Rod Flanders", age: 10, gender: "Male")
flanders_house.tenants.create(name: "Todd Flanders", age: 8, gender: "Male")
burns_manor.tenants.create(name: "Mr. Burns", age: 123, gender: "Male")

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

Tenant.find_by(name: "Kristin Wisoky").increment(:age, 1).save
# another of the many ways to do this:
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.age += 1
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

Apartment.find_by(address: "62897 Verna Walk").increment(:num_beds, 1).save
# another of the many ways to do this:
verna_walk = Apartment.find_by(address: "62897 Verna Walk") # look and see that the current num_beds = 2
verna_walk.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# notice that current rent is 2400
verna_walk.update(monthly_rent: 2800)
# another of the many ways to do this:
verna_walk.increment(:monthly_rent, 400).save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.destroy_all("age < 30")
